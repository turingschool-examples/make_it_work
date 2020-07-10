class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def avg_experience
    years_for_each = contestants.map do |contestant|
      contestant.years_of_experience
    end
    years_for_each.sum.fdiv(years_for_each.count)
  end
end
