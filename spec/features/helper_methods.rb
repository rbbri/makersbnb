def signup1
  fill_in(:username, with: 'user1')
  fill_in(:password, with: 'password1')
  fill_in(:name, with: 'User One')
  fill_in(:email, with: 'user1@example.com')
  click_button 'Sign Up'
end

def signup2
  fill_in(:username, with: 'user2')
  fill_in(:password, with: 'password2')
  fill_in(:name, with: 'User Two')
  fill_in(:email, with: 'user2@example.com')
  click_button 'Sign Up'
end

def signup3
  fill_in(:username, with: 'user3')
  fill_in(:password, with: 'password3')
  fill_in(:name, with: 'User Three')
  fill_in(:email, with: 'user3@example.com')
  click_button 'Sign Up'
end

def signup_duplicate_user
  fill_in(:username, with: 'user1')
  fill_in(:password, with: 'password1')
  fill_in(:name, with: 'User One')
  fill_in(:email, with: 'user2@example.com')
  click_button 'Sign Up'
end

def signup_duplicate_email
  fill_in(:username, with: 'user2')
  fill_in(:password, with: 'password1')
  fill_in(:name, with: 'User One')
  fill_in(:email, with: 'user1@example.com')
  click_button 'Sign Up'
end

def signin1
  click_button 'Login'
  fill_in(:username, with: 'user1')
  fill_in(:password, with: 'password1')
  click_button 'log_in'
end

def signin2
  click_button 'Login'
  fill_in(:username, with: 'user2')
  fill_in(:password, with: 'password2')
  click_button 'log_in'
end

def list_cornwall
  click_button 'List a Space'
  fill_in(:name, with: 'Cornwall')
  fill_in(:description, with: 'This is a beautiful house in Cornwall')
  fill_in(:price, with: '100')
  click_button 'List my Space'
end

def list_devon
  click_button 'List a Space'
  fill_in(:name, with: 'Devon')
  fill_in(:description, with: 'This is a beautiful house in Devon')
  fill_in(:price, with: '100')
  click_button 'List my Space'
end

def request_cornwall
  click_link 'Cornwall'
  click_button 'Request to Book'
end

def request_devon
  click_link 'Devon'
  click_button 'Request to Book'
end
