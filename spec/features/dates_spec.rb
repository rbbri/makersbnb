feature 'viewing dates' do
  scenario 'a user can select available dates' do
    visit '/spaces'
    click_link('Beautiful house in cornwall')
    click_button('Request to Book')
    expect('/requests').to have_content('Beautiful house in cornwall')
  end
end
