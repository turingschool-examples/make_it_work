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

  describe '#avg_experience' do
    it 'can calculate average years of experience for it\'s contestants' do

      recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")

      news_chic.contestants.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      news_chic.contestants.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      expect(news_chic.contestants.count).to eq(2)
      expect(news_chic.avg_experience).to eq(12.5)
    end
  end
end
