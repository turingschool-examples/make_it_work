require "rails_helper"

RSpec.describe "Project's show page" do
	before :each do
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @project = Project.create!(name: "Litfit", material: "Lamp Shade", challenge: @challenge)
	end

  it "should show project's name, material and theme of the challenge" do
    visit "/projects/#{@project.id}"
    expect(page).to have_content(@project.name)
    expect(page).to have_content(@project.material)
    expect(page).to have_content(@project.challenge.theme)
  end
end
