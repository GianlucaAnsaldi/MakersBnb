feature 'viewing spaces' do
  scenario 'User can list spaces' do
    connection = PG.connect(dbname: 'makersbnb_test') #swap with Space.create
    connection.exec("INSERT INTO spaces (name, description, price) VALUES ('loft', 'lovely loft', '1000');") #swap this too
    visit('/listings')
    expect(page).to have_content('loft')
    expect(page).to have_content('lovely loft')
    expect(page).to have_content('1000')
  end
end