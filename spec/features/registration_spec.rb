feature 'User registration' do
  scenario 'a user can sign up' do
    visit '/'
    test_user_info()
    click_button 'Sign up'
    
    expect(current_path).to eq '/listings'
  end
end