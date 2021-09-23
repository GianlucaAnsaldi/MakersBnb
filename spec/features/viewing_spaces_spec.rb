feature 'viewing spaces' do
  scenario 'User can list spaces' do
    Spaces.add(name: 'Loft', description: 'lovely loft', price: 1000)
    visit('/listings')
    expect(page).to have_content('loft')
    expect(page).to have_content('lovely loft')
    expect(page).to have_content('1000')
  end
end