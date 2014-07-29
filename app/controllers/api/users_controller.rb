module Api
  class UsersController < ApplicationController
    before_action :require_signed_in, only: [:show, :backed_projects,
      :started_projects, :followed_projects]

    def show
      @user = User.includes(:backed_projects, :started_projects, :followed_projects).find(current_user.id)
      render :show
    end

  end
end
