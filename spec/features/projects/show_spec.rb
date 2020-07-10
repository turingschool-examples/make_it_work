RSpec.describe "as a visitor", type: :feature do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @project_1 = @recycled_material_challenge.projects.create(name: "Litfit", material: "Lamp Shade")
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    ContestantProject.create(contestant_id: @jay.id, project_id: @project_1.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @project_1.id)
  end

  describe 'when I visit a projects show page' do
    it 'I see that projects name, material and theme' do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Project: #{@project_1.name}")
      expect(page).to have_content("Material: #{@project_1.material}")
      expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    end

    it 'I also displays number of contestants' do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Number of Contestants: 2")
    end

    it 'displays the average years of experience for the contestants who worked on the project' do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Average Contestant Experience: 10.5 years")
    end

    it 'displays a form to add an existing contestant to this project' do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Add a new contestant to this project:")

      fill_in('Contestant ID', with: '3')

      click_on('Add Contestant')

      expect(current_path).to eq("/projects/#{@project_1.id}")
      expect(page).to have_content("Number of Contestants: 3")

      visit "/contestants"

      expect(page).to have_content("#{@gretchen.name}")
    end
  end
end
