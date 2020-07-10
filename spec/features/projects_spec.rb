require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "when I visit a project's show page" do
    it "shows the project's name and material" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit "/projects/#{news_chic.id}"
      
      expect(page).to have_content("Material: #{news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")
    end
  end
end
