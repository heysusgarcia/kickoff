module Api
  class UpdatesController < ApplicationController
    before_action :restrict_create_access, only: [:create]

    def create
      @project = Project.find(params[:id])
      @update = @project.updates.new(update_params)
      if @update.save
        render json: @update
      else
        render json: @update.errors_full_messages, status: :unprocessable_entity
      end
    end

    private
    def update_params
      params.require(:update).permit(:body)
    end

    def restrict_create_access
      @project = Project.find(params[:id])
      if !project.is_founder?(current_user)
        redirect_to api_project_url(@project)
      end
    end
  end
end
