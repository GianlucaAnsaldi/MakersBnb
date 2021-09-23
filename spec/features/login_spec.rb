feature 'User log in' do
  scenario 'a user can log into their account' do
    visit '/'
    test_user_info()
    click_button 'Sign up'
    visit '/'
    click_button 'Login'
    test_user_info()
    click_button 'Login'
    
    expect(current_path).to eq '/listings'
  end
end