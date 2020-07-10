require 'rails_helper'

RSpec.describe "add contestant to project" do
  it "allows user to fill out form to add contestant" do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

    visit "/projects/#{news_chic.id}"

    click_on "Add Contestant To Project"
    expect(current_path).to eq("/projects/#{news_chic.id}/contestants/new")

    fill_in :name, with: "Michelle Obama"
    fill_in :age, with: 56
    fill_in :hometown, with: "Chicago"
    fill_in :years_of_experience, with: 30

    click_on "Submit Contestant"
    expect(current_path).to eq("/projects/#{news_chic.id}")
    expect(page).to have_content("Michelle Obama")
    expect(page).to have_content("Chicago")
    expect(page).to have_content("Number Of Contestants: 2")
  end
end
