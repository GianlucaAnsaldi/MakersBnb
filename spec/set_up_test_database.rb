require 'pg'

def set_up_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec('DROP TABLE spaces, users, requests;')
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60));')
  connection.exec('CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(280), price INTEGER);')
  connection.exec('CREATE TABLE requests (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users (id), space_id INTEGER REFERENCES spaces (id), is_approved BOOLEAN DEFAULT FALSE);')
  # connection.exec("TRUNCATE spaces, requests;")  
end