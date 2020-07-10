class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def total_contestants
    contestants.count
  end

  def average_years_of_experience
    return 0 if contestants.average(:years_of_experience).nil?
    contestants.average(:years_of_experience)
  end
end
