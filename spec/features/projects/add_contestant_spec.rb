require 'rails_helper'

RSpec.describe "Add contestant to project process" do
  before(:each) do
    @bob = Contestant.create!(name: "Bob", age: 12, hometown: "Denver", years_of_experience: 6)
    @hank = Contestant.create!(name: "Hank", age: 13, hometown: "Denver", years_of_experience: 4)

    @challenge_1 = Challenge.create(theme:                  "Apartment Furnishings",
                                    project_budget:         1200)

    @challenge_2 = Challenge.create(theme:                  "House Furnishings",
                                    project_budget:          1800)

    @project_1 = @challenge_1.projects.create(name:         "Litfit",
                                              material:     "Lamp Shade")

    @project_2 = @challenge_2.projects.create(name:         "WhereIsIt",
                                              material:     "Bull Horn")

    @contestant_projects_1 =
                    ContestantProject.create(contestant_id:  @bob.id,
                                             project_id:     @project_1.id)

    @contestant_projects_2 =
                    ContestantProject.create(contestant_id:  @hank.id,
                                             project_id:     @project_1.id)
  end

  describe "While on a project's show page" do
    it "allows visitor to see a form to add contest to project" do
      visit "projects/#{@project_2.id}"

      expect(page).to have_field("Add Contestant")
      expect(page).to have_content("Number of Contestants: ")
    end

    it "once a user clicks on the \"add contestant to project\" button, a PATCH request is sent, the contestant is added, and the user is redirected to project's show page" do
      visit "projects/#{@project_2.id}"

      fill_in :contestant_id, with: @bob.id

      click_button "Add Contestant To Project"

      expect(current_path).to eq("/projects/#{@project_2.id}")
      expect(page).to have_content("Number of Contestants: 1")

      visit "/contestants"

      within ("#contestant-#{@bob.id}") do
        expect(page).to have_content(@project_2.name)
      end
    end
  end
end
