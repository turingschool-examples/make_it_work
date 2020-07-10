class ContenstantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end
end
