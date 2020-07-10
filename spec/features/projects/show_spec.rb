require "rails_helper"
#
# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
RSpec.describe "Project show page" do
  it "shows project's name, material, and theme of the challenge" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create!(contestant: jay, project: news_chic)
    ContestantProject.create!(contestant: gretchen, project: news_chic)
    ContestantProject.create!(contestant: gretchen, project: upholstery_tux)
    ContestantProject.create!(contestant: kentaro, project: boardfit)
    ContestantProject.create!(contestant: kentaro, project: upholstery_tux)
    ContestantProject.create!(contestant: erin, project: boardfit)


    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("News Chic")
    expect(page).to have_content("Material: Newspaper")
    expect(page).to have_content("Challenge Theme: Recycled Material")

    # As a visitor,
    # When I visit a project's show page
    # I see a count of the number of contestants on this project
    #
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings
    #   Number of Contestants: 3 )

    expect(page).to have_content("Number of Contestants: 2")

    #     As a visitor,
    # When I visit a project's show page
    # I see the average years of experience for the contestants that worked on that project
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings
    #   Number of Contestants: 3
    #   Average Contestant Experience: 10.25 years)

    visit "/projects/#{lit_fit.id}"

    expect(page).to have_content("Average Contestant Experience: 10.25 years")




  end
end
