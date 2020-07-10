require "rails_helper"

RSpec.describe "Project's Show Page" do
  it "shows the project's name and material" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    visit "/projects/#{boardfit.id}"
    expect(page).to have_content(boardfit.name)
    expect(page).to have_content(boardfit.material)
    expect(page).to have_content(recycled_material_challenge.theme)
  end

end
