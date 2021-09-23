feature 'Visualize incoming requests' do
  scenario 'shows all pending incoming requests' do
    connection = PG.connect(dbname: 'makersbnb_test')
    visit '/'
    test_user_info()
    click_button 'Sign up'
    visit '/'
    click_button 'Login'
    test_user_info()
    click_button 'Login'
    connection.exec("INSERT INTO users (email, password) VALUES ('test@example.com','secret123') RETURNING id, email, password;")
    connection.exec("INSERT INTO users (email, password) VALUES ('test2@example.com','secret456') RETURNING id, email, password;")
    connection.exec("INSERT INTO users (email, password) VALUES ('test3@example.com','secret789') RETURNING id, email, password;")
    connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('Loft','a nice loft', 90, 1) RETURNING id, name, description, price, owner_id;")
    connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('House','a nice house', 80, 1 ) RETURNING id, name, description, price, owner_id;")
    connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('Flat','an ugly flat', 10, 2 ) RETURNING id, name, description, price, owner_id;")
    Request.generate(user_id: 2, space_id: 1)
    Request.generate(user_id: 2, space_id: 2)
    Request.generate(user_id: 3, space_id: 2)
    Request.generate(user_id: 3, space_id: 3)
  
    visit '/requests'
    expect(page).to have_content('Loft')
    expect(page).to have_content('House')
    expect(page).not_to have_content('Flat')
  end
end