require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end
  describe 'methods' do
    it '#total_contestants' do
      jay = Contestant.create!(name: "Jay McCarroll", age: "31", hometown: "San Diego", years_of_experience: 3)
      victor = Contestant.create!(name: "Victor Ramirez", age: "25", hometown: "Tucson", years_of_experience: 6)

      crafts = Challenge.create!(theme: "Crafts", project_budget: 200)

      leatherfeather = crafts.projects.create!(name: "LeatherFeather", material: "Duct Tape")

      ContestantProject.create!(contestant: jay, project: leatherfeather)
      ContestantProject.create!(contestant: victor, project: leatherfeather)

      expect(leatherfeather.total_contestants).to eq(2)
    end
  end
end
