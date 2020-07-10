class ChallengesController < ApplicationController

  def show
    @challenges = Challenge.all
  end
end
