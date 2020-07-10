require "rails_helper"

RSpec.describe "Contestants Index Page Spec" do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    @rug_tuxedo = @recycled_material_challenge.projects.create(name: "Rug Tuxedo", material: "Rugs")
    @leather_feather = @recycled_material_challenge.projects.create(name: "Leather Feather", material: "Leather")

    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

    ContestantProject.create(contestant_id: @kentaro.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @rug_tuxedo.id)
    ContestantProject.create(contestant_id: @jay.id, project_id: @leather_feather.id)
  end

  describe "As a visitor" do
    describe "When I visit the contestants index page" do
      it "I see the names of all contestants and the names of their projects" do
        visit "/contestants"

        expect(page).to have_content("Kentaro Kameyama")
        expect(page).to have_content("Projects: Litfit, Rug Tuxedo")

        expect(page).to have_content("Jay McCarroll")
        expect(page).to have_content("Projects: Leather Feather")
      end
    end
  end
end
