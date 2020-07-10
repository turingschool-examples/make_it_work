require 'rails_helper'

RSpec.describe "projects show page" do
  it "displays project name and material info with challenge theme it applies to" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    visit "projects/#{boardfit.id}"

    expect(page).to have_content("Boardfit")
    expect(page).to have_content("Material: Cardboard Boxes")
    expect(page).to have_content("Challenge Theme: Recycled Material")
  end
end
