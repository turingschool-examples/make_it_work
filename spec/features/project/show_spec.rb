require 'rails_helper'

RSpec.describe "Project's show page" do
  before :each do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  it "displays project's name and material" do
    visit "/projects/#{@lit_fit.id}"

    within '.project-details' do
      expect(page).to have_content(@lit_fit.name)
      expect(page).to have_content(@lit_fit.material)
    end
  end

  it "displays the project's challenge theme" do
    visit "/projects/#{@lit_fit.id}"

    within '.challenge-details' do
      expect(page).to have_content(@furniture_challenge.theme)
    end
  end

  it "displays the project's number of contestants" do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: jay.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: @lit_fit.id)


    visit "/projects/#{@lit_fit.id}"

    within '.contestant-details' do
      expect(page).to have_content(@lit_fit.contestants.count)
    end
  end
end
