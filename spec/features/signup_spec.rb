feature 'signing-up' do

  scenario 'user can sign-up to site' do
    visit '/'
    expect(page).to have_selector(:button, "Sign Up")
  end

end
