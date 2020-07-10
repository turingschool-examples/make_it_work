class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end
  
  def show
    @challenge = Challenge.find(params[:id])
    @project = Project.find(params[:id])
  end

end