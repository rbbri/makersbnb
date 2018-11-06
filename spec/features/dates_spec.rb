feature 'viewing dates' do
  scenario 'a user can select available dates' do
    signup1
    click_button 'List a Space'
    fill_in(:name, with: 'Beautiful house in cornwall')
    click_button 'List my Space'
    click_button 'Logout'
    signup2
    click_link('Beautiful house in cornwall')
    click_button('Request to Book')
    expect(page).to have_content('Beautiful house in cornwall')
  end
end
