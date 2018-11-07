# space model
class Space < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  has_many :requests
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user_id, presence: true, uniqueness: true
end
