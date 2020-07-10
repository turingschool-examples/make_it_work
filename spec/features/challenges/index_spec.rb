require 'rails_helper'

RSpec.describe 'Challenges Index Spec' do
  before :all do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
  end

  describe "When I visit /challenges" do
    it "shows all of the challenges teme and budget" do

    visit '/challenges'

    expect(page).to have_content(@recycled_material_challenge.theme)
    expect(page).to have_content(@recycled_material_challenge.project_budget)
  end
  end
end



# User Story 1 of 3
# ​
# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
