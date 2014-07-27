module Api
  class ProjectsController < ApplicationController

    def create
      @project = Project.new(project_params)
      @project.founder_id = current_user.id
      @project.founder_name = current_user.name
      if @project.save
        render json: @project
      else
        render json: @project.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.try(:destroy)
      render json: {}
    end

    def index
      @projects = Project.all
      render json: @projects
    end

    def show
      @project = Project.includes(:followings, :backings).find(params[:id])
      render :show
    end

    def followers
      @project = Project.find(params[:id])
      render json: @project.followers
    end

    def funders
      @project = Project.find(params[:id])
      render json: @project.funders
    end

    def update
      @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
        render json: @project
      else
        render json: @project.errors.full_messages, status: :unprocessable_entity
      end
    end

    private
    def project_params
      params.require(:project).permit(:title, :description, :funding_goal,
        :category, :duration, :website
      )
    end

  end
end
