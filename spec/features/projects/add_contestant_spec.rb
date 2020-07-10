require 'rails_helper'

RSpec.describe 'projects show page' do
  before :each do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: @jay.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
  end

  it 'can add an existing contestant to a project' do
    visit "/projects/#{@lit_fit.id}"
    expect(page).to have_content("Number of Contestants: 0")

    expect(page).to have_content("Form to add a contestant to #{@lit_fit.name}")

    fill_in :contestant_id, with: "#{@kentaro.id}"
    click_button "Add Contestant To Project"

    expect(current_path).to eq("/projects/#{@lit_fit.id}")
    expect(page).to have_content("Number of Contestants: 1")

    visit "/contestants"

    within("#contestant-#{@kentaro.id}") do
      expect(page).to have_content("Projects: Upholstery Tuxedo Litfit")
    end
  end
end
