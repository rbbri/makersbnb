# Request model
class Request < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :space, foreign_key: 'space_id'
  validates :user_id, presence: true
  validates :space_id, presence: true
  # validates :date_created, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :confirmation_status, presence: true
end
