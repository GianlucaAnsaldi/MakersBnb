feature 'User log in' do
  scenario 'a user can log into their account' do
    visit '/'
    fill_in('email', with: 'email@example.com')
    fill_in('password', with: 'supersecret123')
    click_button 'Sign up'
    visit '/'
    click_button 'Login'
    fill_in('email', with: 'email@example.com')
    fill_in('password', with: 'supersecret123')
    click_button 'Login'
    
    expect(current_path).to eq '/listings'
  end

  scenario 'a user cannot log in if they have not registered' do
    visit '/'
    click_button 'Login'
    fill_in('email', with: 'email@example.com')
    fill_in('password', with: 'supersecret123')
    click_button 'Login'
    
    expect(current_path).to eq '/sessions/new'
  end
end