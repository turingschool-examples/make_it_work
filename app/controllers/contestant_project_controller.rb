class ContestantProjectController < ApplicationController
  def index
    @contestants = Contestant.all
    @projects = Project.all
  end
end
