feature 'requesting a space' do
  scenario "a user can view requests they've made and recieved" do
    visit '/requests'
    expect(page).to have_content("Requests I've made")
    expect(page).to have_content("Requests I've received")
  end
end
