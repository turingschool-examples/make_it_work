require 'rails_helper'

RSpec.describe 'Project show page' do
  it "shows the project's name, material, and theme of the challenge" do
    challenge = Challenge.create(theme: "summer", project_budget: 250)
    project = Project.create(name: "project 1", material: "denim", challenge_id: challenge.id)

    visit "/projects/#{project.id}"
    
    expect(current_path).to eq("/projects/#{project.id}")
    expect(page).to have_content("Project Name: #{project.name}")
    expect(page).to have_content("Material: #{project.material}")
    expect(page).to have_content("Theme: #{project.challenge.theme}")
  end
end