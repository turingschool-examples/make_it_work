class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
  end

  def update
    project = Project.find(params[:project_id])
    new_contestant = Contestant.find(params[:contestant_id])
    ContestantProject.create(contestant: new_contestant, project: project)
    redirect_to "/projects/#{project.id}"
  end

end
