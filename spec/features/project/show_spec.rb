require 'rails_helper'

RSpec.describe "Project's show page", type: :feature do
  it "displays project's name and material" do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit "/projects/#{lit_fit.id}"

    within '.project-details' do
      expect(page).to have_content(lit_fit.name)
      expect(page).to have_content(lit_fit.material)
    end
  end
end
