require 'rails_helper'

RSpec.describe "Contestant's index page" do
  before :each do
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

  end

  it "displays a list of all contestant's names" do
    visit "/contestants"
    within '.contestant_details' do
      expect(page).to have_content(@jay.name)
      expect(page).to have_content(@gretchen.name)
    end
  end

  it "displays a list of all contestant project's names" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    ContestantProject.create(contestant_id: @jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: upholstery_tux.id)

    visit "/contestants"
    within '.contestant_details' do
      expect(page).to have_content(@jay.projects.name)
      expect(page).to have_content(@gretchen.projects.name)
    end
  end
end
