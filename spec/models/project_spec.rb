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

  describe "methods" do
    it ".count_contestants" do
      challenge1 = Challenge.create(theme: "Bridal Wear", project_budget: 150)
      project1 = Project.create(name: "Trash Bag Wedding Dress", material: "trash bags", challenge: challenge1)
      jay = Contestant.create(name: "Jay McCarroll", age: 30, hometown: "New York City", years_of_experience: 10)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 25, hometown: "Boston", years_of_experience: 5)
      ContestantProject.create(contestant: jay, project: project1)
      ContestantProject.create(contestant: kentaro, project: project1)

      expect(project1.count_contestants).to eq(2)
    end
  end
end
