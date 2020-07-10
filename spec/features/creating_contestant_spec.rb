require "rails_helper"

RSpec.describe '', type: :feature do
  before :all do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end
  it 'can create a contestant' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("No of contestants: 2")

    fill_in :name, with: 'Kwibe Merci'
    fill_in :age, with: 56
    fill_in :hometown, with: "Uvira"
    fill_in :years_of_experience, with: 25

    click_on "Add Contestant To Project"
    new_contestant = Contestant.last

    expect(current_path).to eq("/projects/#{@news_chic.id}")

    expect(page).to have_content("No of contestants: 3")

    visit "/contestants"

    within("div##{new_contestant.id}") do
      expect(page).to have_content('Kwibe Merci')
      expect(page).to have_content("News Chic")
    end
  end
end
