feature 'signing in' do
  before do
    visit '/'
    signup1
    click_button 'Logout'
  end

  scenario 'signed up user signs out' do
    expect(page).to have_content 'Sign up to MakersBnB'
    expect(page).not_to have_content 'Welcome User One!'
  end

  scenario 'signed up user signs out and signs back in' do
    signin1
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content 'Welcome User One!'
  end

  scenario 'signed up user signs in with wrong password' do
    click_button 'Login'
    fill_in(:username, with: 'user1')
    fill_in(:password, with: 'wrong')
    click_button 'log_in'
    expect(page).to have_content('Incorrect username or password')
  end

  scenario 'signed up user signs in with wrong username' do
    click_button 'Login'
    fill_in(:username, with: 'wrong')
    fill_in(:password, with: 'password1')
    click_button 'log_in'
    expect(page).to have_content('Incorrect username or password')
  end
end
