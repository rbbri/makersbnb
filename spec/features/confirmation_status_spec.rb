feature "confirming a space" do
  before do
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
  end

  scenario "an owner confirms a space" do
    within('div#request_received_Devon') do
      click_button 'Confirm'
      expect(page).not_to have_selector(:button, 'Confirm')
      expect(page).not_to have_selector(:button, 'Reject')
      expect(page).to have_content 'Confirmed'
    end
    click_button 'Logout'
    signin2
    click_button 'Requests'
    within('div#request_made_Devon') do
      expect(page).to have_content "Confirmed"
    end
  end
  scenario "an owner rejects a space" do
    within('div#request_received_Devon') do
      click_button 'Reject'
    end
    click_button 'Logout'
    signin2
    click_button 'Requests'
    within('div#request_made_Devon') do
      expect(page).to have_content "Rejected"
    end
  end



end
