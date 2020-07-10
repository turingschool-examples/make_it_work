class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    @projects = Project.all
    @challenges = Challenge.all
    @contestant_projects = ContestantProject.all

    # binding.pry
  end
end
