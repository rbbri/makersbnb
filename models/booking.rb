class Booking < ActiveRecord::Base
  belongs_to :space, foreign_key: 'space_id'
  belongs_to :request, foreign_key: 'request_id'
  validates :start_date, presence: true
  validates :end_date, presence: true

end
