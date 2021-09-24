feature 'User can book a space' do
  scenario 'booking a space' do
    sign_up_and_login()

    space = Spaces.add(name: 'Loft', description: 'lovely loft', price: 1000, owner_id: 1)
    visit('/listings')
    click_link 'Loft'
    expect(current_path).to eq "/listings/#{space.id}"
    expect(page).to have_content('Loft')
    expect(page).to have_content('lovely loft')
    expect(page).to have_content('1000')

    click_button 'Request booking'
    expect(current_path).to eq '/listings'
    expect(page).to have_content('Loft')
    expect(page).to have_content('lovely loft')
    expect(page).to have_content('1000')
  end
end