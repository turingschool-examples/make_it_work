require 'rails_helper'

RSpec.describe "As a visitor" do
  describe 'when I visit a projects show page' do
    xit 'I can see the project name, material, and theme' do

      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Name: News Chic")
      expect(page).to have_content("Material: Newspaper")
      expect(page).to have_content("Theme: Apartment Furnishings")

    end
  end
end
