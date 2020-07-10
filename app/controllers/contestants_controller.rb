class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    @projects = Project.all
    @con_proj = ContestantProject.all
  end
end
