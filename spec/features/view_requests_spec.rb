feature 'requests' do
  scenario 'view booking request' do
    visit '/'
    fill_in('email', with: 'email@example.com')
    fill_in('password', with: 'supersecret123')
    click_button 'Sign up'
    
      
    expect(current_path).to eq '/listings/new'
    fill_in('name', with: 'Loft')
    fill_in('description', with: 'A nice loft')
    fill_in('price', with: 90)
    click_button ('List my space')
    expect(current_path).to eq '/listings'
    expect(page).to have_content 'A nice loft'
  end 
end 

