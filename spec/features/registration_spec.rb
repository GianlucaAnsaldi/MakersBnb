feature 'User registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('email', with: 'email@example.com')
    fill_in('password', with: 'supersecret123')
    click_button 'Sign up'
    
    expect(current_path).to eq '/listings'
  end
end