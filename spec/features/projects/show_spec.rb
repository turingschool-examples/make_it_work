RSpec.describe 'as a visitor' do
  describe 'When I visit a project\'s show page ("/projects/:id")' do
    before :each do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    end

    it 'I see that project\'s name and material,
    and I also see the theme of the challenge that this project belongs to.' do

      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content('News Chic')
      expect(page).to have_content('Newspaper')
      expect(page).to have_content('Recycled Material')
    end
  end
end
