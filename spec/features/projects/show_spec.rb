require 'rails_helper'

RSpec.describe "Project show page", type: :feature do
  before(:each) do
    @bob = Contestant.create!(name: "Bob", age: 12, hometown: "Denver", years_of_experience: 6)
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
                                                      project_id: @project_1.id)
  end

  describe "When I visit a project's show page" do
    it "allows user to see that project's name" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Name: #{@project_1.name}")
    end

    it "allows user to see that project's material" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Material: #{@project_1.material}")
    end

    it "allows user to see that project's theme" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Theme: #{@project_1.challenge.theme}")
    end

    it "allows user to see that number of contestants on this project" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Project Contestants: #{@project_1.contestants.count}")
    end

    it "allows user to see the average years of experience for contestants on this project" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Average Contestant Experience: 5.0")
    end
  end
end
