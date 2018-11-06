describe 'Request' do
  describe "Validations" do
    # the other tests are here
    it "has one user" do
      association = Request.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it "has one space" do
      association = Request.reflect_on_association(:space)
      expect(association.macro).to eq :belongs_to
    end
  end
end
