require 'rails_helper'

RSpec.describe 'Projects show page' do
  it "shows the name and material of the project as well as the theme of the challenge it belongs to" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit "/projects/#{lit_fit.id}"

    expect(page).to have_content("Project: Litfit")
    expect(page).to have_content("Material: Lamp")
    expect(page).to have_content("Challenge Theme: Apartment Furnishings")
  end
end
