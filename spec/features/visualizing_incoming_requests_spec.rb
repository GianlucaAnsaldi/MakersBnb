feature 'Visualize incoming requests' do
  scenario 'shows all pending incoming requests' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users (email, password) VALUES ('test@example.com','secret123') RETURNING id, email, password;")
    connection.exec("INSERT INTO users (email, password) VALUES ('test2@example.com','secret456') RETURNING id, email, password;")
    connection.exec("INSERT INTO users (email, password) VALUES ('test3@example.com','secret789') RETURNING id, email, password;")
    connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('Loft','a nice loft', 90, 1);")
    connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('House','a nice house', 80, 1 );")
    connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('Flat','an ugly flat', 10, 2 );")
    Request.generate(2, 1)
    Request.generate(2, 2)
    Request.generate(3, 2)
    Request.generate(3, 3)
    visit '/requests'
    expect(page).to have_content('Loft')
    expect(page).to have_content('House')
    expect(page).not_to have_content('Flat')
  end
end