class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_experience
    total_experience = contestants.sum do |contestant|
      contestant.years_of_experience
    end.to_f
    total_experience / contestants.count.to_f
  end

  def add_contestant(contestant_id)
    contestants << Contestant.find(contestant_id)
  end
end
