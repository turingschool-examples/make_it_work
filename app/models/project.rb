class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def average_contestant_experience
    arr = contestants.map do |contestant|
      contestant.years_of_experience
    end
    arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end
end
