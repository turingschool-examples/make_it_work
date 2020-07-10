require 'rails_helper'

RSpec.describe "Create a new contestant project" do

  it "can add a contestant to a project" do
    challenge1 = Challenge.create(theme: "Bridal Wear", project_budget: 150)
    project1 = Project.create(name: "Trash Bag Wedding Dress", material: "trash bags", challenge: challenge1)
    jay = Contestant.create(name: "Jay McCarroll", age: 30, hometown: "New York City", years_of_experience: 15)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 25, hometown: "Boston", years_of_experience: 5)
    ContestantProject.create(contestant: jay, project: project1)

    visit '/contestants'

    within("#contestants-#{kentaro.id}") do
      expect(page).to have_content(kentaro.name)
      expect(page).not_to have_content(project1.name)
    end

    visit "/projects/#{project1.id}"

    expect(page).to have_content("Add A Contestant")
    expect(page).to have_content("Number of Contestants: 1")

    fill_in :contestant, with: kentaro.id

    click_on "Add Contestant To Project"

    expect(current_path).to eq("/projects/#{project1.id}")
    expect(page).to have_content("Number of Contestants: 2")

    visit '/contestants'

    within("#contestants-#{kentaro.id}") do
      expect(page).to have_content(kentaro.name)
      expect(page).to have_content(project1.name)
    end
  end
end
