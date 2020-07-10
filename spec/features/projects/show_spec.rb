require "rails_helper"

RSpec.describe "Project Show Page Spec" do
  before :each do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp Shade")

    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

    ContestantProject.create(contestant_id: @gretchen.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @lit_fit.id)
  end

  describe "As a visitor" do
    describe "When I visit a project's show page" do
      it "I see that project's details" do
        visit "/projects/#{@lit_fit.id}"

        expect(page).to have_content(
          "Litfit\n"+
          "Material: Lamp Shade\n"+
          "Challenge Theme: Apartment Furnishings\n"+
          "Number of Contestants: 3\n"+
          "Average Contestant Experience: 11.67 years"
        )
      end

      it "I can add a contestant to this project" do
        visit "/projects/#{@lit_fit.id}"
        expect(page).to have_content("Number of Contestants: 3")

        fill_in :add_contestant_id, with: @jay.id

        click_button "Add Contestant To Project"

        expect(current_path).to eq("/projects/#{@lit_fit.id}")
        expect(page).to have_content("Number of Contestants: 4")

        visit "/contestants"
        expect(page).to have_content("Jay McCarroll\nProjects: Litfit")
      end
    end
  end
end
