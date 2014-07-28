module Api
  class ProjectFundingsController < ApplicationController
    before_action :require_signed_in, only: [:create]

    def create
      project_id.Project.find(params[:id]).id
      @project_funding = ProjectFunding.new({
        project_id: project_id, funder_id: current_user.id
      })
      if !@project_funding.save
        render json: @project_funding.errors.full_messages, status: :unprocessable_entity
    end
  end
end
