class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end

  def new
    @project = Project.find(params[:id])
  end
end
