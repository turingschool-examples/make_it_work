require 'rails_helper'

RSpec.describe "project show page form" do
  it "allows visitor to add contest to project" do
    challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
    project = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: challenge.id)
    ken = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Denver", years_of_experience: 10)
    jay = Contestant.create!(name: "Jay McCarroll", age: 25, hometown: "Denver", years_of_experience: 5)
    ContestantProject.create!(contestant: ken, project: project)

    visit "projects/#{project.id}"

    expect(page).to have_content("Number of Contestants: 1")

    fill_in :contestant_id, with: jay.id
    click_button "Add Contestant To Project"

    expect(current_path).to eq("/projects/#{project.id}")
    expect(page).to have_content("Number of Contestants: 2")

    visit "/contestants"

    within ("#contestant-#{jay.id}") do
      expect(page).to have_content(project.name)
    end
  end
end

# User Story Extension 2 - Adding a contestant to a project
# ​
# I see a form to add a contestant to this project
# When I fill out a field with an existing contestants id
# And hit "Add Contestant To Project"
# I'm taken back to the project's show page
# And I see that the number of contestants has increased by 1
# And when I visit the contestants index page
# I see that project listed under that contestant's name
