class Space < ActiveRecord::Base
  validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :user_id, presence: true, uniqueness: true
end
