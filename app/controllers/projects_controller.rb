class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    redirect_to "/projects/#{@project.id}"
  end

  private
  def contestant_project_params
    params.permit(:contestant_id, :project_id)
  end
end
