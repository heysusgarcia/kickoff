module Api
  class CommentsController < ApplicationController
    before_action :restrict_commenting, only: [:create]

    def create
      @project = Project.find(params[:project_id])
      @comment = @project.comments.new(comment_params)
      if @comment.save
        render json: @comment
      else
        render json: @comment.errors.full_messages, status: :unprocessable_entity
      end
    end

    private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def restrict_commenting
      @project = Project.find(params[:project_id])
      if !@project.is_backer?(current_user)
        redirect_to api_project_url(@project)
      end
    end
  end
end
