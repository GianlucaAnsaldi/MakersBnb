feature 'requests' do
  scenario 'view booking request' do
    visit '/'
    test_user_info()
    click_button 'Sign up'
    
    click_link 'My request'
    expect(page).to have_content 'Your requests'
  end 
end 