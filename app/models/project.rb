class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def average_contestant_experience
    total_experience = contestants.map(&:years_of_experience).sum.to_f
    (total_experience / contestants.size).round(2)
  end
end
