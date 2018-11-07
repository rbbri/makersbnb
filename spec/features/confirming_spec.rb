feature "confirming a space" do
  scenario "an owner confirms a space" do
    visit '/'
    signup1
    list_devon
    click_button 'Logout'
    signup2
    request_devon
    within('div#request_made_Devon') do
      expect(page).to have_content "Awaiting confirmation"
    end
    click_button 'Logout'
    signin1
    click_button 'Requests'
    within('div#request_received_Devon') do
      click_button 'Confirm'
    end
    click_button 'Logout'
    signin2
    click_button 'Requests'
    within('div#request_made_Devon') do
      expect(page).to have_content "Confirmed"
    end
  end
end
