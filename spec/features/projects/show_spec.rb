require 'rails_helper'

RSpec.describe "project show page" do
  it "shows project's name, material, and theme of the challenge" do
    challenge1 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 500)
    project1 = challenge1.projects.create(name: "Litfit", material: "Lamp Shade")

    visit "/projects/#{project1.id}"

    expect(page).to have_content(project1.name)
    expect(page).to have_content(project1.material)
    expect(page).to have_content(challenge1.theme)
  end

  it "shows total number of contestants" do
    jay = Contestant.create!(name: "Jay McCarroll", age: "31", hometown: "San Diego", years_of_experience: 3)
    victor = Contestant.create!(name: "Victor Ramirez", age: "25", hometown: "Tucson", years_of_experience: 6)

    crafts = Challenge.create!(theme: "Crafts", project_budget: 200)

    leatherfeather = crafts.projects.create!(name: "LeatherFeather", material: "Duct Tape")

    ContestantProject.create!(contestant: jay, project: leatherfeather)
    ContestantProject.create!(contestant: victor, project: leatherfeather)

    visit "/projects/#{leatherfeather.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end
end
