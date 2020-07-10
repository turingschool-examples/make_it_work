class ProjectsController < ApplicationController
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
    @average_years = total / @num_contestants
  end
end
