class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def count_contestants
    contestants.count
  end

  def average_years_exp
    if contestants.empty?
      0
    else
    total_contestants = contestants.count
    total_years = contestants.sum {|contestant| contestant.years_of_experience}
    total_years / total_contestants
    end
  end
end
