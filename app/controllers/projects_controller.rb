class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.find(params[:id])
    @contestant = 
    ContestantProject.create(contestant_id: @contestant.id, project_id: @project_1.id)
  end
end
