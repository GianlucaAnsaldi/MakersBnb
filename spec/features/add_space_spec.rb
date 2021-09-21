feature 'add space' do
  scenario 'list a new space' do
    visit('/listings')
    click_button('Add Listing')
      
    expect(page).to have_content 'List a space'
    fill_in ('name') with: 'Loft'
    fill_in ('description') with: 'A nice loft'
    fill_in ('price') with: 90
    click_button ('List my space')
    expect(page).to have_content 'A nice loft'
  end 
end 

