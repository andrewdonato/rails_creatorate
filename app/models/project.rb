class Project < ActiveRecord::Base

  #belongs_to :creator

  has_many :collaborations
  has_many :users, through: :collaborations

  # has_many :project_skills
  # has_many :skills, through: :project_skills


end

