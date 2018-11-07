require './models/space'
describe 'Space' do
  describe 'Validations' do
    it 'has many requests' do
      association = Space.reflect_on_association(:requests)
      expect(association.macro).to eq :has_many
    end
    it 'has one user' do
      association = Space.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it 'has many bookings' do
      association = Space.reflect_on_association(:bookings)
      expect(association.macro).to eq :has_many
    end
  end
end
