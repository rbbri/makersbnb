feature 'signing-up' do
  scenario 'user can sign-up to site' do
    signup1
    expect(page).to have_content 'Welcome User One!'
    expect(page).to have_current_path('/spaces')
  end

  scenario 'a user signs up with a pre existing username' do
    signup1
    click_button 'Logout'
    signup_duplicate_user
    expect(page).to have_content 'This username is already in use'
  end

  scenario 'a user signs up with a pre existing username' do
    signup1
    click_button 'Logout'
    signup_duplicate_email
    expect(page).to have_content 'This email is already in use'
  end

end
