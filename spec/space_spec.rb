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
  end
end
