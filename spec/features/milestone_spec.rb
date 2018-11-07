feature 'availability' do

  scenario 'a user lists a space and makes it available for a range of dates' do
    visit('/')
    signup1
    list_space
    click_button 'Logout'
    # Need to test the calendar
  end

end

feature 'requests' do
  before do
    visit('/')
    signup1
    list_space
    click_button 'Logout'
  end

  scenario 'multiple requests against the same space' do
    visit('/')
    signup2
    click_link 'Listing 1'
    request
    click_button 'Logout'
    signup3
    click_link 'Listing 1'
    request
    click_button 'Logout'
    signin1
    click_button 'Requests'
    expect(page).to have_content('Listing 1 1 December 2018 2 December 2018', count: 2)
  end

end
