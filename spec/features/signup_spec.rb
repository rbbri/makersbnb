feature 'signing-up' do

  scenario 'user can sign-up to site' do
    visit '/'
    fill_in('username', with: 'GB')
    fill_in('password', with: '12345')
    fill_in('name', with: 'Gordon')
    fill_in('email', with: 'gb@gov.uk')
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome Gordon!'
    expect(page).not_to have_content "Sign up to MakersBnB"
  end

end
