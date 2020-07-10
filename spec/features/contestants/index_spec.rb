RSpec.describe 'as a visitor' do
  describe 'when I visit the contestants index page ("/contestants")' do

    before :each do
      #CHALLENGES
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      #PROJECTS
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
      @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      #CONTESTANTS
      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      #CONTESTANT_PROJECTS
      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
      ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    end

    it 'I see a list of names of all the contestants' do

      visit "/contestants"
      expect(page).to have_content('Jay McCarroll')
      expect(page).to have_content('Kentaro Kameyama')
    end

    it 'and under each contestants name I see a list of the projects (names) that they\'ve been on' do

      visit "/contestants"

      within('#jay-mccarroll') do
        expect(page).to have_content('News Chic')
      end
      within('#kentaro-kameyama') do
        expect(page).to have_content('Boardfit')
        expect(page).to have_content('Upholstery Tuxedo')
      end

    end
  end
end
