class ProjectsController < ApplicationController
  
  def show
    @project = Project.find(params[:id])
    @contestants = Contestant.all
    @experience = @contestants.sum do |contestant|
      contestant.years_of_experience
    end
    @experience = @experience / @contestants.count
  end

end