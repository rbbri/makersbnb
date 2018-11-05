class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
