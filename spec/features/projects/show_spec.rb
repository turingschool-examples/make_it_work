require 'rails_helper'

RSpec.describe "project show page" do
  it "displays the project name and material and theme of challengeproject belongs to" do
    challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
    project = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: challenge.id)

    visit "projects/#{project.id}"

    expect(page).to have_content(project.name)
    expect(page).to have_content(project.material)
    expect(page).to have_content(challenge.theme)
  end
  it "displays count of the number of contestants on this project" do
    challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
    project = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: challenge.id)
    ken = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Denver", years_of_experience: 10)
    jay = Contestant.create!(name: "Jay McCarroll", age: 25, hometown: "Denver", years_of_experience: 5)
    ContestantProject.create!(contestant: ken, project: project)
    ContestantProject.create!(contestant: jay, project: project)

    visit "projects/#{project.id}"

    expect(page).to have_content("Number of Contestants: 2")
    # User Story 3 of 3
    # I see a count of the number of contestants on this project
    # ​
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings
    #   Number of Contestants: 3 )
  end
end

# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
