class ProjectsController < ApplicationController
  def show
    project = Project.find(params[:id])
    @project_name = project.name
    @project_material = project.material
    @project_theme = project.challenge.theme
  end
end
