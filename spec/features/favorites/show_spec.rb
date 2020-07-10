require 'rails_helper'

RSpec.describe "When I visit a project's show page" do
  it "I see the project's name and material, and the theme of the challenge the project belongs to" do
    recycled = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projects/#{recycled.id}"

    expect(page).to have_content("Project: #{news_chic.name}")
    expect(page).to have_content("Material: #{news_chic.material}")
    expect(page).to have_content("Challenge Theme: #{recycled.theme}")
  end
end
