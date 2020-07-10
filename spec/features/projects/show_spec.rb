require 'rails_helper'

RSpec.describe "When I visit a project's show page" do
  it "I see the project's name and material, it challenge theme, and its number of contestants" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: jay.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

    visit "/projects/#{upholstery_tux.id}"

    expect(page).to have_content(upholstery_tux.name)
    expect(page).to have_content("Material: #{upholstery_tux.material}")
    expect(page).to have_content("Challenge Theme: #{upholstery_tux.challenge.theme}")
    expect(page).to have_content("Number of Contestants: 2")
  end
end
