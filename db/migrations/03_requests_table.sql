CREATE TABLE requests (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users (id), space_id INTEGER REFERENCES spaces (id), is_approved BOOLEAN DEFAULT FALSE);

