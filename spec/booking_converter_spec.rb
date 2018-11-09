require 'booking_converter'
require 'date'
describe BookingConverter do
  let(:booking) { double(:booking, start_date: Date.parse('2018-11-15'), nights: 4) }
  describe '.convert' do
    it 'converts booking' do
      range = BookingConverter.convert(booking)
      expect(range).to eq('{"from":[2018,10,15],"to":3}')
    end
  end
end
