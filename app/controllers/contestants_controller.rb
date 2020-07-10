class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end

  def add
    project = Project.find(params[:project_id])
    if project.contestants.include?(Contestant.find(params[:contestant_id]))
      redirect_to "/projects/#{project.id}"
    else
      project.add_contestant(params[:contestant_id])
      redirect_to "/projects/#{project.id}"
    end 
  end
end
