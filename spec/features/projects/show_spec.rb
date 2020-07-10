require 'rails_helper'

RSpec.describe 'Project show page' do
  it 'displays the project name, material, and the theme of the challenge it belongs to' do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit "/projects/#{lit_fit.id}"

    expect(page).to have_content("#{lit_fit.name}")
    expect(page).to have_content("#{lit_fit.material}")
    expect(page).to have_content("#{furniture_challenge.theme}")
  end
end
