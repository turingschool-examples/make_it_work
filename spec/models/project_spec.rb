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
    it '.average_experience' do
      challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      project = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: challenge.id)
      ken = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Denver", years_of_experience: 10)
      jay = Contestant.create!(name: "Jay McCarroll", age: 25, hometown: "Denver", years_of_experience: 5)
      ContestantProject.create!(contestant: ken, project: project)
      ContestantProject.create!(contestant: jay, project: project)

      expect(project.average_experience).to eq(7.5)
    end
  end
end
