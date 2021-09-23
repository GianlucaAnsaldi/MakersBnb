feature 'requests' do
  scenario 'view booking request' do
    sign_up_and_login()
    
    click_link 'My request'
    expect(page).to have_content 'Your requests'
  end 
end 