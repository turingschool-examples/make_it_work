class ProjectsController < ApplicationController
  # def index
  #   @project = Project.all
  # end
  
  def show
    @project = Project.find(params[:id])
    # @project = Project.find(@challenge.id)
  end

end