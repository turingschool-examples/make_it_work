require 'rails_helper'

RSpec.describe "contestants index page" do
  it "displays names of all the contestants and their projects" do
    ken = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Denver", years_of_experience: 10)
    jay = Contestant.create!(name: "Jay McCarroll", age: 25, hometown: "Denver", years_of_experience: 5)
    challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
    project = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: challenge.id)
    project2 = Project.create!(name: "LeatherFeather", material: "Leather", challenge_id: challenge.id)
    project3 = Project.create!(name: "Rug Tuxedo", material: "Rub", challenge_id: challenge.id)
    ContestantProject.create!(contestant: ken, project: project)
    ContestantProject.create!(contestant: ken, project: project3)
    ContestantProject.create!(contestant: jay, project: project2)

    visit "/contestants"

    within ("#contestant-#{ken.id}") do
      expect(page).to have_content(ken.name)
      expect(page).to have_content(project.name)
      expect(page).to have_content(project3.name)
    end

    within ("#contestant-#{jay.id}") do
      expect(page).to have_content(jay.name)
      expect(page).to have_content(project2.name)
    end
  end
end

# As a visitor,
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on
# ​
# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo
# ​
#         Jay McCarroll
#         Projects: LeatherFeather)
