require 'rails_helper'

RSpec.describe "Contestant Index Page" do
  before :each do
    @challenge1        = Challenge.create!(theme: "Dress", project_budget: 500)

    @recycled_material = @challenge1.projects.create!(name: "Recycled Material", material: "Bottle")
    @bridal_wear       = @challenge1.projects.create!(name: "Bridal Wear", material: "Leaf")
    @apartment         = @challenge1.projects.create!(name: "Apartment Furnishings", material: "lamp Shade")

    @bob               = Contestant.create!(name: 'Bob', age: 32, hometown: 'Denver', years_of_experience: 9)
    @sara              = Contestant.create!(name: 'Sara', age: 26, hometown: 'Salt Lake City', years_of_experience: 4)
    @olivia            = Contestant.create!(name: 'Olivia', age: 25, hometown: 'Centennial', years_of_experience: 7)

    ContestantProject.create!(contestant: @sara,project: @recycled_material)
    ContestantProject.create!(contestant: @olivia, project: @bridal_wear)
    ContestantProject.create!(contestant: @olivia, project: @apartment)
  end

  it "can show a list of all contestants name and a list of their projects" do

    visit "/contestants"

    expect(page).to have_content(@sara.name)
    expect(page).to have_content("Recycled Material")

    expect(page).to have_content(@olivia.name)
    expect(page).to have_content("Bridal Wear")
    expect(page).to have_content("Apartment Furnishings")


  end

end

# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on
# ​
# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo
