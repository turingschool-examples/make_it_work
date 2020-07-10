require "rails_helper"

RSpec.describe "Project Show Page Spec" do
  before :each do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp Shade")
  end

  describe "As a visitor" do
    describe "When I visit a project's show page" do
      it "I see that project's name and material and challenge theme" do
        visit "/projects/#{@lit_fit.id}"

        expect(page).to have_content("Litfit")
        expect(page).to have_content("Material: Lamp Shade")
        expect(page).to have_content("Challenge Theme: Apartment Furnishings")
      end
    end
  end
end
