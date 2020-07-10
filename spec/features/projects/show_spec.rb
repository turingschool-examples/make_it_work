RSpec.describe "as a visitor", type: :feature do
  describe 'when I visit a projects show page' do
    it 'I see that projects name, material and theme' do

      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      project_1 = recycled_material_challenge.projects.create(name: "Litfit", material: "Lamp Shade")


      visit "/projects/#{project_1.id}"

      expect(page).to have_content("Theme: #{recycled_material_challenge.name}")
      expect(page).to have_content("Name: #{project_1.name}")
      expect(page).to have_content("Material: #{project_1.material}")
    end
  end




As a visitor,
When I visit a project's show page ("/projects/:id"),
I see that project's name and material
And I also see the theme of the challenge that this project belongs to.
(e.g.    Litfit
    Material: Lamp Shade
  Challenge Theme: Apartment Furnishings)
