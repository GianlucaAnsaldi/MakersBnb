feature 'add space' do
  scenario 'list a new space' do
    sign_up_and_login()
    
    visit('/listings')
    click_button('Add Listing')
    expect(current_path).to eq '/listings/new'
    fill_in('name', with: 'Loft')
    fill_in('description', with: 'A nice loft')
    fill_in('price', with: 90)
    click_button ('List my space')
    expect(current_path).to eq '/listings'
    expect(page).to have_content 'A nice loft'
  end 
end  

