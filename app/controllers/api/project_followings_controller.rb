module Api
  class ProjectFollowingsController < ApplicationController
    before_action :require_signed_in, only: [:create]

    def create
      project_id = Project.find(params[:id])
      @project_following = ProjectFollowing.new({
        project_id: project_id, follower_id: current_user.id
      })
      if !@project_following.save
        render json: @project_following.errors.full_messages, status: :unprocessable_entity
    end
  end
end
