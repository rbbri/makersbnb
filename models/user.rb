# User model
class User < ActiveRecord::Base
  has_many :spaces
  has_many :requests
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
