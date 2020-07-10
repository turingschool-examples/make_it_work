class Project <ApplicationRecord
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  validates_presence_of :name, :material
  belongs_to :challenge

  def sum_contestants
    contestants.count
  end

  def ave_exp
    contestants.average(:years_of_experience)
  end
end
