require 'rails_helper'

RSpec.describe "project show page" do
  it "shows project's name, material, and theme of the challenge" do
    challenge1 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 500)
    project1 = challenge1.projects.create(name: "Litfit", material: "Lamp Shade")

    visit "/projects/#{project1.id}"

    expect(page).to have_content(project1.name)
    expect(page).to have_content(project1.material)
    expect(page).to have_content(challenge1.theme)
  end
end
