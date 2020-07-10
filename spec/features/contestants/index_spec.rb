require 'rails_helper'

RSpec.describe "Contestants index page" do
  it "shows a list of names of all the contestants and the list of project names that they've been on" do
    challenge1 = Challenge.create(theme: "Bridal Wear", project_budget: 150)
    challenge2 = Challenge.create(theme: "Evening Wear", project_budget: 200)
    challenge3 = Challenge.create(theme: "Beach Wear", project_budget: 100)

    project1 = Project.create(name: "Trash Bag Wedding Dress", material: "trash bags", challenge: challenge1)
    project2 = Project.create(name: "Fancy Ball Gown", material: "silk", challenge: challenge2)
    project3 = Project.create(name: "Tribal Swimsuit", material: "cotton", challenge: challenge3)

    jay = Contestant.create(name: "Jay McCarroll", age: 30, hometown: "New York City", years_of_experience: 10)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 25, hometown: "Boston", years_of_experience: 5)

    ContestantProject.create(contestant: jay, project: project1)
    ContestantProject.create(contestant: jay, project: project2)
    ContestantProject.create(contestant: kentaro, project: project3)

    visit '/contestants'

    within("#contestants-#{jay.id}") do
     expect(page).to have_content(jay.name)
     expect(page).to have_content(project1.name)
     expect(page).to have_content(project2.name)
    end

    within("#contestants-#{kentaro.id}") do
      expect(page).to have_content(kentaro.name)
      expect(page).to have_content(project3.name)
    end
  end
end
