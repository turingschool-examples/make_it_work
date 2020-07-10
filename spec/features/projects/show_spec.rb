require 'rails_helper'


RSpec.describe "Project's Show Page" do
  describe "When I a project's show page" do
    it "can see a project's name and material" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("News Chic")
      expect(page).to have_content("Newspaper")
    end
  end
end
