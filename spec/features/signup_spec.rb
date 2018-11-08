feature 'signing-up' do
  before do
    visit '/'
    signup1
  end

  scenario 'user signs up to site' do
    expect(page).to have_content 'Welcome User One!'
    expect(page).to have_current_path('/spaces')
  end

  scenario 'a user signs up with a pre existing username' do
    click_button 'LOGOUT'
    signup_duplicate_user
    expect(page).to have_content 'This username is already in use'
    expect(page).not_to have_content 'Welcome User One!'
  end

  scenario 'a user signs up with a pre existing email' do
    click_button 'LOGOUT'
    signup_duplicate_email
    expect(page).to have_content 'This email is already in use'
    expect(page).not_to have_content 'Welcome User One!'
  end
end
