require "rails_helper"

RSpec.describe "When I visit a project show page" do
  before :each do
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: @upholstery_tux.id)
  end

  it "I see the project's name and material" do
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Upholstery Tuxedo")
    expect(page).to have_content("Couch")
    expect(page).to have_content("Apartment Furnishings")
  end

  it "shows a count of all contestants" do
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Contestants on this Project :2")
  end

  it "shows the average years of experience of all contestants" do
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Average Years of Experience: 10")
  end
end
