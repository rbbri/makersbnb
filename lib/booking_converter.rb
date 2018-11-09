require 'json'
module BookingConverter
  def self.convert(booking)
    { from: arrayify(booking.start_date), to: (booking.nights - 1) }.to_json
  end

  def self.arrayify(date)
    date_array = date.to_s.split('-').map(&:to_i)
    date_array[1] -= 1
    date_array
  end
end
