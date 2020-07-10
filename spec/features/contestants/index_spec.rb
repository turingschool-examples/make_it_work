require 'rails_helper'

RSpec.describe "Contestant index page" do
  before(:each) do
    @bob = Contestant.create!(name: "Bob", age: 12, hometown: "Denver", years_of_experience: 4)
    @hank = Contestant.create!(name: "Hank", age: 13, hometown: "Denver", years_of_experience: 4)

    @challenge_1 = Challenge.create(theme:               "Apartment Furnishings",
                                    project_budget:      1200)

    @challenge_2 = Challenge.create(theme:               "House Furnishings",
                                    project_budget:      1800)

    @project_1 = @challenge_1.projects.create(name:      "Litfit",
                                              material:  "Lamp Shade")

    @project_2 = @challenge_2.projects.create(name:      "WhereIsIt",
                                              material:  "Bull Horn")

    @contestant_projects_1 = ContestantProject.create(contestant_id: @bob.id,
                                                       project_id: @project_1.id)

    @contestant_projects_2 = ContestantProject.create(contestant_id: @hank.id,
                                                      project_id: @project_2.id)
  end

  it "shows contestant names" do
    visit "/contestants"

    expect(page).to have_content("Name: #{@bob.name}")
    expect(page).to have_content("Name: #{@hank.name}")
  end

  it "shows list of project names contestant has been on" do
    visit "/contestants"

    expect(page).to have_content("Project Names: #{@bob.projects.name}")
    expect(page).to have_content("Project Names: #{@hank.projects.name}")
  end
end
