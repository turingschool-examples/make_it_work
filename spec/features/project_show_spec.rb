require 'rails_helper'

RSpec.describe 'project show page', type: :feature do
  before(:each) do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
  end

  it 'can access a show page for a given project' do
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("#{@upholstery_tux.name}")
    expect(page).to have_content("Material: #{@upholstery_tux.material}")
    expect(page).to have_content("Challenge Theme: #{@furniture_challenge.theme}")
  end

  it 'can show the number of contestants working on a given project' do
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end

  it 'can show the average number of years of contestant experience' do
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Average Contestant Experience: 10 years")
  end
end
