class ContestantProjectsController < ApplicationController

  def create
    project = Project.find(params[:project_id])
    ContestantProject.create(create_params)
    redirect_to "/projects/#{project.id}"
  end

  private

  def create_params
    params.permit(:contestant_id, :project_id)
  end
end
