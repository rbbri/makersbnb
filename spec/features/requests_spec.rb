feature 'requesting a space' do
  scenario "a user makes a request on another user's property" do
    visit '/'
    signup1
    list_devon
    click_button 'Logout'
    signup2
    list_cornwall
    request_devon
    click_button 'Logout'
    signup3
    request_cornwall
    click_button 'Logout'
    signin2
    click_button 'Requests'
    within('td#requests_made') do
      expect(page).to have_content 'Devon'
      expect(page).not_to have_content 'Cornwall'
    end
    within('td#requests_received') do
      expect(page).to have_content 'Cornwall'
      expect(page).not_to have_content 'Devon'
    end
  end


end
