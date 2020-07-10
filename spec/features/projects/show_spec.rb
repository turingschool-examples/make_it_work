require 'rails_helper'

RSpec.describe "Project show page" do
  it "I visit a project's show page ('/projects/:id') and I see the project's name, material and challenge theme" do

    challenge1 = Challenge.create(theme: "Bridal Wear", project_budget: 150)
    project1 = Project.create(name: "Trash Bag Wedding Dress", material: "trash bags", challenge: challenge1)

    visit "/projects/#{project1.id}"

    expect(page).to have_content(project1.name)
    expect(page).to have_content("Material: #{project1.material}")
    expect(page).to have_content("Challenge Theme: #{challenge1.theme}")
  end

  it "shows a count of the number of contestants on the project" do

    challenge1 = Challenge.create(theme: "Bridal Wear", project_budget: 150)
    project1 = Project.create(name: "Trash Bag Wedding Dress", material: "trash bags", challenge: challenge1)
    jay = Contestant.create(name: "Jay McCarroll", age: 30, hometown: "New York City", years_of_experience: 10)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 25, hometown: "Boston", years_of_experience: 5)
    ContestantProject.create(contestant: jay, project: project1)
    ContestantProject.create(contestant: kentaro, project: project1)

    visit "/projects/#{project1.id}"
    expect(page).to have_content("Number of Contestants: 2")
  end
end
