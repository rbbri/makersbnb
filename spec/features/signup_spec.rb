feature 'signing-up' do
  scenario 'user can sign-up to site' do
    signup1
    expect(page).to have_content 'Welcome User One!'
    expect(page).to have_current_path('/spaces')
  end
end
