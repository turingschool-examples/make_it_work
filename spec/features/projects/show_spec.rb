require "rails_helper"

RSpec.describe "Project's show page" do
	before :each do
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @contestant_1 = Contestant.create(name: "Kathy", age: 27, hometown: "Denver", years_of_experience: 0)
    @contestant_2 = Contestant.create(name: "Justin", age: 27, hometown: "Denver", years_of_experience: 20)

    @litfit = @contestant_1.projects.create!(name: "Litfit", material: "Lamp Shade", challenge: @challenge)
    @rug = @contestant_1.projects.create!(name: "Rug Tuxedo", material: "Rugs", challenge: @challenge)
    @leather = @contestant_2.projects.create!(name: "LeatherFeather", material: "Leather", challenge: @challenge)
	end

  it "should show project's name, material and theme of the challenge" do
    visit "/projects/#{@litfit.id}"
    expect(page).to have_content(@litfit.name)
    expect(page).to have_content(@litfit.material)
    expect(page).to have_content(@litfit.challenge.theme)
  end

  it "should show the count of the number of contestants on this project" do
    visit "/projects/#{@litfit.id}"
    expect(page).to have_content("Number of contestants: 1")
  end
end

# User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project
# ​
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )
