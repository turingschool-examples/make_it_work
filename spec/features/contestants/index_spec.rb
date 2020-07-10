RSpec.describe "as a visitor", type: :feature do
  describe 'when I visit the contestants index page' do
    it 'I see the names of all contestants and their projects' do
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      project_1 = recycled_material_challenge.projects.create(name: "Litfit", material: "Lamp Shade")
      ContestantProject.create(contestant_id: jay.id, project_id: project_1.id)


      visit "/contestants"

      expect(page).to have_content("#{jay.name}")
      expect(page).to have_content("Projects: #{project_1.name}")
    end
  end
end
