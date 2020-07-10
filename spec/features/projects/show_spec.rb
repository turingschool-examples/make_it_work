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
  end
end
