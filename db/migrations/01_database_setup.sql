CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;

CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(280), price INTEGER);
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60));
CREATE TABLE requests (id SERIAL PRIMARY KEY, requesting_user FOREIGN KEY(id) REFERENCES users(id), space_id FOREIGN KEY(id) REFERENCES spaces(id), approved? BOOLEAN);

id, requesting_user, space_id