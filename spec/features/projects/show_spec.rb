require 'rails_helper'

RSpec.describe "Projects show page" do
  before :each do
    @challenge1        = Challenge.create!(theme: "Dress", project_budget: 500)

    @recycled_material = @challenge1.projects.create!(name: "Recycled Material", material: "Bottle")
    @bridal_wear       = @challenge1.projects.create!(name: "Bridal Wear", material: "Leaf")
    @apartment         = @challenge1.projects.create!(name: "Apartment Furnishings", material: "lamp Shade")

    @bob               = Contestant.create!(name: 'Bob', age: 32, hometown: 'Denver', years_of_experience: 9)
    @sara              = Contestant.create!(name: 'Sara', age: 26, hometown: 'Salt Lake City', years_of_experience: 4)
    @olivia            = Contestant.create!(name: 'Olivia', age: 25, hometown: 'Centennial', years_of_experience: 7)

    ContestantProject.create!(contestant: @bob, project: @recycled_material)
    ContestantProject.create!(contestant: @bob, project: @apartment)
    ContestantProject.create!(contestant: @sara,project: @recycled_material)
    ContestantProject.create!(contestant: @sara,project: @bridal_wear)
    ContestantProject.create!(contestant: @olivia, project: @recycled_material)
    ContestantProject.create!(contestant: @olivia, project: @bridal_wear)
    ContestantProject.create!(contestant: @olivia, project: @apartment)

  end
  it "shows the name of the project and the materials" do

    visit "/projects/#{@recycled_material.id}"

    expect(page).to have_content("#{@recycled_material.name}")
    expect(page).to have_content("Theme: #{@challenge1.theme}")
    expect(page).to have_content("Material: #{@recycled_material.material}")
  end

end
