class ContenstantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end

  def create
    project = Project.find(params[:project_id])
    contestant = Contestant.create(contestant_params)
    project.contestants << contestant

    redirect_to "/projects/#{project.id}"
  end

  private
  def contestant_params
    params.permit(:name, :age, :hometown, :years_of_experience)
  end
end
