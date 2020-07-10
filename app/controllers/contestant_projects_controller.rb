class ContestantProjectsController < ApplicationController
  def new
  end

  def create
    con_proj = ContestantProject.create(con_proj_params)
    redirect_to "/projects/#{params[:project_id]}"
  end

  private

  def con_proj_params
    params.permit(:project_id, :contestant_id)
  end
end
