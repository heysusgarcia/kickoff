module Api
  class ProjectFollowingsController < ApplicationController
    before_action :require_signed_in, only: [:create]

    def create
      @project_following = ProjectFollowing.new(project_followings_params)
      @project_following.follower_id = current_user.id
      if @project_following.save
        render json: @project_following
      else
        render json: @project_following.errors.full_messages, status: :unprocessable_entity
      end
    end

    private
    def project_following_params
      params.require(:project_following).permit(:project_id, :project_title)
    end
  end
end
