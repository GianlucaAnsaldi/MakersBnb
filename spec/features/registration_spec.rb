feature 'User registration' do
  scenario 'a user can sign up' do
    sign_up_and_login()
    
    expect(current_path).to eq '/listings'
  end
end