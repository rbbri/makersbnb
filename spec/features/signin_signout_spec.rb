feature "signing in" do
  before do
    signup1
  end

  scenario "signed up user signs out" do
    click_link "Logout"
    expect(page).to have_content "Sign up to MakersBnB"
    expect(page).not_to have_content "Welcome User One!"
  end
  # scenario "signed up user signs in" do
  #   visit '/'
  #   click_link "Login"
  #   fill_in('username', with: 'User1')
  #   fill_in('password', with: 'password1')
  #   click_button 'Log in'
  #   expect(page).to have_current_path('/spaces')
  # end
end
