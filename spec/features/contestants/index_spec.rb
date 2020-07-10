require 'rails_helper'

RSpec.describe 'Contestant index page' do
  it "shows contestant names, a the projects they are working on" do
    
    challenge = Challenge.create(theme: "summer", project_budget: 250)
    contestant1 = Contestant.create(name: "Jane Doe", age: 22, hometown: "Denver", years_of_experience: 2)
    contestant2 = Contestant.create(name: "John Doe", age: 23, hometown: "Golden", years_of_experience: 1)
    project1 = Project.create(name: "project 1", material: "denim", challenge_id: challenge.id)
    project2 = Project.create(name: "project 2", material: "denim", challenge_id: challenge.id)
    project3 = Project.create(name: "project 3", material: "denim", challenge_id: challenge.id)
    project4 = Project.create(name: "project 4", material: "denim", challenge_id: challenge.id)
    visit "/contestants"
    
    expect(current_path).to eq("/contestants")
    expect(page).to have_content("#{contestant.name}")
    expect(page).to have_content("Projects: #{contestant.material}")
    expect(page).to have_content("Theme: #{project.challenge.theme}")
  end
  
  
end