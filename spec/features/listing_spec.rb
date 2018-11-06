feature 'listing a space' do
  scenario 'a logged in user lists a new space' do
    signup1
    click_button 'List a Space'
    fill_in 'name', with: 'Listing 1'
    fill_in 'description', with: 'Description 1'
    fill_in 'price', with: '1'
    click_button 'List my Space'
    expect(page).to have_content('Listing 1')
    expect(page).to have_content('Description 1')
    expect(page).to have_content('£1')
  end
end
