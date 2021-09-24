def sign_up_and_login
  visit '/'
  fill_in('email', with: 'email@example.com')
  fill_in('password', with: 'supersecret123')
  click_button 'Sign up'
end
