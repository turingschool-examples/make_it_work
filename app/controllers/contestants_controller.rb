class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end

  def add
    project = Project.find(params[:project_id])
    project.add_contestant(params[:contestant_id])
    redirect_to "/projects/#{project.id}"
  end
end
