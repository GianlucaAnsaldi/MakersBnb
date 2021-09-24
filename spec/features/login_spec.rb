feature 'User log in' do
  scenario 'a user can log into their account' do
    sign_up_and_login()
    
    expect(current_path).to eq '/listings'
  end
end