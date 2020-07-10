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
    expect(page).to have_content("Number Of Contestants: 2")

    visit "/projects/#{upholstery_tux.id}"

    expect(page).to have_content(upholstery_tux.name)
    expect(page).to have_content(upholstery_tux.material)
    expect(page).to have_content(furniture_challenge.theme)
    expect(page).to have_content("Number Of Contestants: 1")
  end

  it "displays average years of experience for all contestants per project" do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("Average Contestant Experience(in years): 11.0")
  end

  it "displays form to add a contestant" do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

    visit "projects/#{news_chic.id}"

    click_on "Add Contestant To Project"
    expect(current_path).to eq("/projects/#{news_chic.id}/contestants/new")
  end
end

# As a visitor,
# When I visit a project's show page
# I see a form to add a contestant to this project
# When I fill out a field with an existing contestants id
# And hit "Add Contestant To Project"
# I'm taken back to the project's show page
# And I see that the number of contestants has increased by 1
# And when I visit the contestants index page
# I see that project listed under that contestant's name
