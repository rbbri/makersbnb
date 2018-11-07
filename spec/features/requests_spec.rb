feature 'requesting a space' do
  scenario "a user makes a request on another user's property" do
    visit '/'
    signup1
    list_devon
    list_cornwall
    click_button 'Logout'
    signup2
    request_cornwall
    click_button 'Logout'
    signup3
    request_devon
    expect(page).to have_content('Devon')
    expect(page).not_to have_content('Cornwall')
  end
end
