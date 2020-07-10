require 'rails_helper'

RSpec.describe "When I visit a project's show page" do
  it "I see the project's name and material, it challenge theme, its number of contestants, and contestants' avg yrs experience" do
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
    expect(page).to have_content("Average Contestant Experience: 12.5")
  end

  it "I can add a contestant to the project" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: jay.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

    visit "/contestants"

    within("#contestant-#{kentaro.id}") do
      expect(page).to_not have_content(upholstery_tux.name)
    end

    visit "/projects/#{upholstery_tux.id}"

    fill_in :contestant_id, with: "#{kentaro.id}"
    click_on 'Add Contestant to Project'

    expect(current_path).to eq("/projects/#{upholstery_tux.id}")
    expect(page).to have_content("Number of Contestants: 3")
    # expect(page).to have_content("Average Contestant Experience: 11")

    visit "/contestants"

    within("#contestant-#{kentaro.id}") do
      expect(page).to have_content(upholstery_tux.name)
    end
  end
end
