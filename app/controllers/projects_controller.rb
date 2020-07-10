class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def add
    @project = Project.find(params[:id])
    @contestant = Contestant.find(contestant_id)
    ContestantProject.create(contestant: @contestant, project: @project)
    redirect_to "/projects/#{@project.id}"
  end

  private
  def contestant_id
    require "pry"; binding.pry
    # CANT SEEM TO SEE WHERE THE FILLED_IN DATA IS TO FIND THE CONTESTANT WITH THE MATCHING ID
  end
end
