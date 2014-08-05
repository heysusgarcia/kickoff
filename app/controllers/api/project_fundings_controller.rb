module Api
  class ProjectFundingsController < ApplicationController
    before_action :require_signed_in, only: [:create]
    wrap_parameters :project_funding, include: [:project_id, :project_title, :amount_funded]

    def create
      @project_funding = ProjectFunding.new(project_funding_params)
      @project_funding.funder_id = current_user.id
      if @project_funding.save
        render json: @project_funding
      else
        render json: @project_funding.errors.full_messages, status: :unprocessable_entity
      end
    end

    private
    def project_funding_params
      params.require(:project_funding).permit(:project_id, :project_title, :amount_funded)
    end
  end
end
