require "rails_helper"

RSpec.describe "Project's show page" do
	before :each do
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @contestant_1 = Contestant.create(name: "Kathy", age: 27, hometown: "Denver", years_of_experience: 0)
    @contestant_2 = Contestant.create(name: "Justin", age: 27, hometown: "Denver", years_of_experience: 20)

    @litfit = Project.create!(name: "Litfit", material: "Lamp Shade", challenge: @challenge)
    @rug = Project.create!(name: "Rug Tuxedo", material: "Rugs", challenge: @challenge)
    @leather = Project.create!(name: "LeatherFeather", material: "Leather", challenge: @challenge)

    ContestantProject.create!(contestant: @contestant_1, project: @litfit)
    ContestantProject.create!(contestant: @contestant_2, project: @litfit)
    ContestantProject.create!(contestant: @contestant_1, project: @rug)
    ContestantProject.create!(contestant: @contestant_2, project: @leather)
	end

  it "should show project's name, material and theme of the challenge" do
    visit "/projects/#{@litfit.id}"
    expect(page).to have_content(@litfit.name)
    expect(page).to have_content(@litfit.material)
    expect(page).to have_content(@litfit.challenge.theme)

    visit "/projects/#{@rug.id}"
    expect(page).to have_content(@rug.name)
    expect(page).to have_content(@rug.material)
    expect(page).to have_content(@rug.challenge.theme)
  end

  it "should show the count of the number of contestants on this project" do
    visit "/projects/#{@litfit.id}"
    expect(page).to have_content("Number of contestants: 2")

    visit "/projects/#{@rug.id}"
    expect(page).to have_content("Number of contestants: 1")
  end

  it "should display the average years of experience for the contestant that worked for that project" do
    visit "/projects/#{@litfit.id}"
    expect(page).to have_content("Average Contestant Experience: 10.0 years")

  end
end

# As a visitor,
# When I visit a project's show page
# I see the average years of experience for the contestants that worked on that project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3
#   Average Contestant Experience: 10.25 years)
