module Api
  class ProjectsController < ApplicationController
    def create
      @project = Project.new(project_params)
      @project.founder_id = current_user.id
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
      @project = Project.find(params[:id])
      render json: @project
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
        :amount_raised, :goal_date
      )
    end

    def restrict_create
      redirect_to root_url unless signed_in?
    end

  end
end
