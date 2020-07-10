require "rails_helper"

RSpec.describe 'display project', type: :feature do
  before :all do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  it 'can show project' do
    visit "/projects/#{@lit_fit.id}"
    expect(page).to have_content("Litfit")
    expect(page).to have_content("Lamp")
    expect(page).to have_content("Apartment Furnishings")
  end
end
