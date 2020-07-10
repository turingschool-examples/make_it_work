require 'rails_helper'

RSpec.describe 'contestant index page' do
  it 'lists names of all contestans and their projects' do
    kentaro = Contestant.create!(name: "Kentaro Kameyama", age: "27", hometown: "Denver", years_of_experience: 5)
    jay = Contestant.create!(name: "Jay McCarroll", age: "31", hometown: "San Diego", years_of_experience: 3)

    apartment_furnishings = Challenge.create!(theme: "Apartment Furnishings", project_budget: 500)
    plastics = Challenge.create!(theme: "Plastics", project_budget: 300)
    crafts = Challenge.create!(theme: "Crafts", project_budget: 200)

    litfit = apartment_furnishings.projects.create(name: "Litfit", material: "Lamp Shade")
    rug_tuxedo = plastics.projects.create!(name: "Rug Tuxedo", material: "Water Bottles")
    leatherfeather = crafts.projects.create!(name: "LeatherFeather", material: "Duct Tape")

    ContestantProject.create!(contestant: kentaro, project: litfit)
    ContestantProject.create!(contestant: kentaro, project: rug_tuxedo)
    ContestantProject.create!(contestant: jay, project: leatherfeather)

    visit '/contestants'

    expect(page).to have_content(kentaro.name)
    expect(page).to have_content(litfit.name)
    expect(page).to have_content(rug_tuxedo.name)
    expect(page).to have_content(jay.name)
    expect(page).to have_content(leatherfeather.name)
  end
end
