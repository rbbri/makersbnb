def signup1
  visit '/'
  fill_in(:username, with: 'user1')
  fill_in('password', with: 'password1')
  fill_in('name', with: 'User One')
  fill_in('email', with: 'user1@example.com')
  click_button 'Sign Up'
end
