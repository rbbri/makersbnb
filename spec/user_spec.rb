require './models/user'
describe 'User' do
  describe 'Validations' do
    it 'has many spaces' do
      association = User.reflect_on_association(:spaces)
      expect(association.macro).to eq :has_many
    end
    it 'has many requests' do
      association = User.reflect_on_association(:requests)
      expect(association.macro).to eq :has_many
    end
  end
end
