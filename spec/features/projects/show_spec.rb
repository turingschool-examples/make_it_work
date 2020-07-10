require 'rails_helper'

RSpec.describe "When I visit a project's show page" do
  it "I see the project's name and material, and the theme of the challenge the project belongs to" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit "/projects/#{lit_fit.id}"

    expect(page).to have_content(lit_fit.name)
    expect(page).to have_content("Material: #{lit_fit.material}")
    expect(page).to have_content("Challenge Theme: #{lit_fit.challenge.theme}")
  end
end
