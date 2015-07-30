class User < ActiveRecord::Base
  has_secure_password

  has_many :collaborations
  has_many :projects, through: :collaborations

end
