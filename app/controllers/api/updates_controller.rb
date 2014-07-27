module Api
  class UpdatesController < ApplicationController

    def create
    end

    def show
    end

    private
    def project_update_params
      params.require(:update).permit(:body)
    end

    def restrict_create_access
    end

    def is_founder?(user)
      params[:project][:founder_id] == user.id
    end
  end
end
