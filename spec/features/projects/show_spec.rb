require 'rails_helper'

RSpec.describe 'Project show page' do
  it 'displays the project name, material, challenge theme, number of contestants, and average experience of the contestants' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
    ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("#{news_chic.name}")
    expect(page).to have_content("#{news_chic.material}")
    expect(page).to have_content("#{recycled_material_challenge.theme}")
    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Average Contestant Experience: 12.5")

    visit "/projects/#{boardfit.id}"

    expect(page).to have_content("#{boardfit.name}")
    expect(page).to have_content("#{boardfit.material}")
    expect(page).to have_content("#{recycled_material_challenge.theme}")
    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Average Contestant Experience: 11.5")

    visit "/projects/#{upholstery_tux.id}"

    expect(page).to have_content("#{upholstery_tux.name}")
    expect(page).to have_content("#{upholstery_tux.material}")
    expect(page).to have_content("#{furniture_challenge.theme}")
    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Average Contestant Experience: 10")

    visit "/projects/#{lit_fit.id}"

    expect(page).to have_content("#{lit_fit.name}")
    expect(page).to have_content("#{lit_fit.material}")
    expect(page).to have_content("#{furniture_challenge.theme}")
    expect(page).to have_content("Number of Contestants: 0")
    expect(page).to have_content("Average Contestant Experience: 0")
  end

  it 'displays a form to add a contestant to the project and increases the number of contestants by 1 when submitted' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
    ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("#{news_chic.name}")
    expect(page).to have_content("#{news_chic.material}")
    expect(page).to have_content("#{recycled_material_challenge.theme}")
    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Average Contestant Experience: 12.5")

    fill_in :contestant_id, with: kentaro.id

    click_button "Add Contestant to Project"

    expect(current_path).to eq("/projects/#{news_chic.id}")

    expect(page).to have_content("#{news_chic.name}")
    expect(page).to have_content("#{news_chic.material}")
    expect(page).to have_content("#{recycled_material_challenge.theme}")
    expect(page).to have_content("Number of Contestants: 3")
    expect(page).to have_content("Average Contestant Experience: 11")
  end
end
