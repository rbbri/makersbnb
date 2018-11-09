require 'json'
# Module to convert bookings into format readable by pickadate calendar
module BookingConverter
  def self.convert(booking)
    if booking.nights == 1
      arrayify(booking.start_date).to_s
    else
      { from: arrayify(booking.start_date), to: (booking.nights - 1) }.to_json
    end
  end

  def self.arrayify(date)
    date_array = date.to_s.split('-').map(&:to_i)
    date_array[1] -= 1
    date_array
  end
end
