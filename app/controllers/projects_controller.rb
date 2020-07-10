class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @challenge = Challenge.find(@project.challenge_id)
    contestant_projects = ContestantProject.all
    contestant_array = contestant_projects.select { |contestant_project| contestant_project.project_id == @project.id }
    @num_contestants = contestant_array.count
    contestants = contestant_array.map do |contestant|
      Contestant.find(contestant.contestant_id)
    end
    total = contestants.inject(0) {|sum, contestant| sum + contestant.years_of_experience }
    if @num_contestants == 0
      @average_years = 0
    else
      @average_years = total / @num_contestants
    end
  end

  def update
    project = Project.find(params[:id])
    contestant = Contestant.find(params[:contestant_id])
    ContestantProject.create(contestant_id: contestant.id, project_id: project.id)
    redirect_to "/projects/#{project.id}"
  end
end
