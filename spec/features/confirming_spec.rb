feature "confirming a space" do
  scenario "an owner confirms a space" do
    visit '/'
    signup1
    list_devon
    click_button 'Logout'
    signup2
    request_devon
    within('div#request_Devon') do
      expect(page).to have_content "Awaiting confirmation"
    end
    click_button 'Logout'
  end
end
