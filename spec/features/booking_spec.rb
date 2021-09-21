feature 'User can book a space' do
  scenario 'booking a space' do
    Spaces.add(name: 'Loft', description: 'lovely loft', price: 1000)
    visit('/')
    click_link 'Loft'
    fill_in 'Date', with: '25/09/21'
    click_link 'My requests'
    expect(page).to have_content 'Loft'
  end
end