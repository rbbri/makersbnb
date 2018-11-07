require './models/booking'
describe 'Booking' do

  describe 'Validations' do
    it 'belongs to a space' do
      association = Booking.reflect_on_association(:space)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to a request' do
      association = Booking.reflect_on_association(:request)
      expect(association.macro).to eq :belongs_to
    end
  end

end
