require 'rails_helper'

RSpec.describe 'Project show page' do
  it "shows the project's name, material, and theme of the challenge" do
    challenge = Challenge.create(theme: "summer", project_budget: 250)
    news_chic = Project.create(name: "project 1", material: "denim", challenge_id: challenge.id)

    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)

    visit "/projects/#{news_chic.id}"
    
    expect(current_path).to eq("/projects/#{news_chic.id}")
    expect(page).to have_content("Project Name: #{news_chic.name}")
    expect(page).to have_content("Material: #{news_chic.material}")
    expect(page).to have_content("Challenge Theme: #{news_chic.challenge.theme}")
    expect(page).to have_content("Number of Contestants: #{news_chic.contestants.count}")
    expect(page).to have_content("Average Contestant Experience: 10")

  end
end