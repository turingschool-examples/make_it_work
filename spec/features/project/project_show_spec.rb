require 'rails_helper'

RSpec.describe "As a visitor" do
  describe 'when I visit a projects show page' do
    it 'I can see the project name, material, and theme' do

      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      visit "/projects/#{upholstery_tux.id}"

      expect(page).to have_content("Name: #{upholstery_tux.name}")
      expect(page).to have_content("Material: #{upholstery_tux.material}")
      expect(page).to have_content("Theme: #{upholstery_tux.challenge.theme}")

    end
  end
end
