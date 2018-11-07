# space model
class Space < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  has_many :requests
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end
