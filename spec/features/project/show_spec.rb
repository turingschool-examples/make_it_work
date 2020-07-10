require 'rails_helper'

RSpec.describe "Project's show page" do
  before :each do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  it "displays project's name and material" do
    visit "/projects/#{@lit_fit.id}"

    within '.project-details' do
      expect(page).to have_content(@lit_fit.name)
      expect(page).to have_content(@lit_fit.material)
    end
  end

  it "displays the project's challenge theme" do
    visit "/projects/#{@lit_fit.id}"

    within '.challenge-details' do
      expect(page).to have_content(@furniture_challenge.theme)
    end
  end
end
