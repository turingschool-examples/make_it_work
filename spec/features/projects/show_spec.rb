RSpec.describe "as a visitor", type: :feature do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @project_1 = @recycled_material_challenge.projects.create(name: "Litfit", material: "Lamp Shade")
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    ContestantProject.create(contestant_id: @jay.id, project_id: @project_1.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @project_1.id)
  end

  describe 'when I visit a projects show page' do
    it 'I see that projects name, material and theme' do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Theme: #{@recycled_material_challenge.theme}")
      expect(page).to have_content("Name: #{@project_1.name}")
      expect(page).to have_content("Material: #{@project_1.material}")
    end

    it 'I also displays number of contestants' do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Number of Contestants: 2")
    end

    it 'displays the average years of experience for the contestants who worked on the project' do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Average Contestant Experience: 10.5")
    end
  end
end
