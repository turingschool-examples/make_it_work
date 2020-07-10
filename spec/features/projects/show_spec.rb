RSpec.describe 'as a visitor' do
  describe 'When I visit a project\'s show page ("/projects/:id")' do
    before :each do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    end

    it 'I see that project\'s name and material,
    and I also see the theme of the challenge that this project belongs to.' do

      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content('News Chic')
      expect(page).to have_content('Material: Newspaper')
      expect(page).to have_content('Challenge Theme: Recycled Material')
    end

    it 'I see a count of the number of contestants on this project' do

      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("Number of Contestants: 2")
    end

    it 'I see the average years of experience for the contestants that worked on that project' do

      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("Average Contestant Experience: 12.5")
    end

    it 'I see a form to add a contestant to this project;
    
    When I fill out a field with an existing contestants id and hit "Add Contestant To Project", I\'m taken back to the project\'s show page and I see that the number of contestants has increased by 1;

    And when I visit the contestants index page, I see that project listed under that contestant\'s name' do

      visit "/projects/#{@news_chic.id}"
      expect(page).to have_content("Number of Contestants: 2")

      fill_in(:name, with: 'Gaby Mendez')
      fill_in(:age, with: 30)
      fill_in(:hometown, with: 'Santo Domingo')
      fill_in(:years_of_experience, with: 1)

      click_on 'Add Contestant'

      expect(current_path).to eq("/projects/#{@news_chic.id}")
      expect(page).to have_content("Number of Contestants: 3")

      visit "/contestants"

      within('#gaby-mendez') do
        expect(page).to have_content('News Chic')
      end
    end
  end
end
