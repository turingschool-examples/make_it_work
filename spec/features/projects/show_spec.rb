require 'rails_helper'

RSpec.describe 'Projects show page' do
  it "shows the name and material of the project as well as the theme of the challenge it belongs to" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit "/projects/#{lit_fit.id}"

    expect(page).to have_content("Project: Litfit")
    expect(page).to have_content("Material: Lamp")
    expect(page).to have_content("Challenge Theme: Apartment Furnishings")
  end

  it 'shows a count of number of contestants on the project' do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)

    visit "/projects/#{upholstery_tux.id}"

    expect(page).to have_content("Total Number of Contestants Participating: 2")
  end
end
