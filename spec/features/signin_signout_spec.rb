feature 'signing in' do
  before do
    signup1
  end

  scenario 'signed up user signs out' do
    click_button 'Logout'
    expect(page).to have_content 'Sign up to MakersBnB'
    expect(page).not_to have_content 'Welcome User One!'
  end
  scenario 'signed up user signs out and signs back in' do
    click_button 'Logout'
    signin1
    expect(page).to have_current_path('/spaces')
  end
end
