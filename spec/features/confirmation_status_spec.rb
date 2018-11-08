feature "confirming a space" do
  before do
    visit '/'
    signup1
    list_devon
    click_button 'LOGOUT'
    signup2
    request_devon
    within('div#request_made_Devon') do
      expect(page).to have_content "Awaiting confirmation"
    end
    click_button 'LOGOUT'
    signin1
    click_button 'REQUESTS'
  end

  scenario "an owner confirms a space" do
    within('div#request_received_Devon') do
      click_button 'Confirm'
    end
    within('div#request_received_Devon') do
      expect(page).not_to have_selector(:button, 'Confirm')
      expect(page).not_to have_selector(:button, 'Reject')
      expect(page).to have_content 'Confirmed'
    end
    click_button 'LOGOUT'
    signin2
    click_button 'REQUESTS'
    within('div#request_made_Devon') do
      expect(page).to have_content "Confirmed"
    end
  end
  scenario "an owner rejects a space" do
    within('div#request_received_Devon') do
      click_button 'Reject'
    end
    click_button 'LOGOUT'
    signin2
    click_button 'REQUESTS'
    within('div#request_made_Devon') do
      expect(page).to have_content "Rejected"
    end
  end



end
