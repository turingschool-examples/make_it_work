require 'rails_helper'

RSpec.describe 'project show page', type: :feature do
  it 'can access a show page for a given project' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("#{news_chic.name}")
    expect(page).to have_content("Material: #{news_chic.material}")
    expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")
  end
end
