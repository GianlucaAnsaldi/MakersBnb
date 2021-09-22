CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;

CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(280), price INTEGER);
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60));
CREATE TABLE requests (id SERIAL PRIMARY KEY, FOREIGN KEY(users_id) REFERENCES users(id), FOREIGN KEY(space_id) REFERENCES spaces(id), approved BOOLEAN);

--Temp table until can get FKs working:
CREATE TABLE requests (id SERIAL PRIMARY KEY, users_id INT, space_id INT, approved BOOLEAN);
