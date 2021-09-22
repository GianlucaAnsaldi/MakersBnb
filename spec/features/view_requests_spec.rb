feature 'requests' do
  scenario 'view booking request' do
    visit '/'
    fill_in('email', with: 'email@example.com')
    fill_in('password', with: 'supersecret123')
    click_button 'Sign up'
    
    click_link 'My request'
    expect(page).to have_content 'Your requests'
  end 
end 