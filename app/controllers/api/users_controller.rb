module Api
  class UsersController < ApplicationController
    before_action :require_signed_in, only: [:show, :backed_projects,
      :started_projects, :followed_projects]
    before_action :restrict_profile_settings, only: [:update]

    def show
      @user = User.includes(:backed_projects, :started_projects, :followed_projects).find(current_user.id)
      render :show
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_profile_params)
        render json: @user
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    private
    def user_profile_params
      params.require(:user).permit(:name, :biography, :location,
        :website, :profile_photo
      )
    end


    def restrict_profile_settings
      redirect_to root_url unless (current_user.id == params[:id].to_i)
    end

  end
end
