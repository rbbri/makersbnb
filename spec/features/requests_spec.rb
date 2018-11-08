feature 'requesting a space' do
  scenario "a user makes a request on another user's property" do
    visit '/'
    signup1
    list_devon
    click_button 'LOGOUT'
    signup2
    list_cornwall
    request_devon
    click_button 'LOGOUT'
    signup3
    request_cornwall
    click_button 'LOGOUT'
    signin2
    click_button 'REQUESTS'
    within('td.requests_made') do
      expect(page).to have_content 'Devon'
      expect(page).not_to have_content 'Cornwall'
    end
    within('td.requests_received') do
      expect(page).to have_content 'Cornwall'
      expect(page).not_to have_content 'Devon'
    end
  end
end
