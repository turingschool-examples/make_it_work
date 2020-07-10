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

  it "should display a form to add an existing contestant to the project" do
    visit "/projects/#{@rug.id}"
    fill_in :contestant_id, with: @contestant_2.id
    click_on "Add Contestant To Project"
    expect(current_path).to eq("/projects/#{@rug.id}")
    expect(page).to have_content("Number of contestants: 2")
    visit "/contestants"
    expect(page).to have_content(@rug.name)
  end
end
