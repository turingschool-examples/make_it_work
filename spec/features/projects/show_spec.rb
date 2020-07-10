require 'rails_helper'

RSpec.describe "Project show page", type: :feature do
  before(:each) do

    @challenge_1 = Challenge.create(theme:               "Apartment Furnishings",
                                    project_budget:      1200)

    @project_1 = @challenge_1.projects.create(name:      "Litfit",
                                              material:  "Lamp Shade")


  end

  describe "When I visit a project's show page" do
    it "allows user to see that project's name" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Name: #{@project_1.name}")
    end

    it "allows user to see that project's material" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content(@project_1.material)
    end

    it "allows user to see that project's theme" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content(@project_1.challenge.theme)
    end
  end
end
