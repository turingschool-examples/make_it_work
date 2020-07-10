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

  it "counts number of contestants who have participated in a project" do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content(news_chic.name)
    expect(page).to have_content(news_chic.material)
    expect(page).to have_content(recycled_material_challenge.theme)
    expect(page).to have_content("Number of Contestants: 2")

    visit "/projects/#{upholstery_tux.id}"

    expext(page).to have_content(upholstery_tux.name)
    expext(page).to have_content(upholstery_tux.material)
    expext(page).to have_content(furniture_challenge.theme)
    expect(page).to have_content("Number of Contestants: 1")
  end
end
