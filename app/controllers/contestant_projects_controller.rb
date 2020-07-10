class ContestantProjectsController < ApplicationController
  def create
    project = Project.find(params[:project].to_i)
    contestant = Contestant.find(params[:contestant].to_i)
    ContestantProject.create(contestant: contestant, project: project)
    redirect_to "/projects/#{project.id}"
  end
end
