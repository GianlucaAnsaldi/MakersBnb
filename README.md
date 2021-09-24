## The Project



## MVP
```

  As a user
  So that I can browse in the app
  I would like to see a list of spaces
 
  As a user
  So that I can rent out my space
  I would like to list a new space
  
  As a user
  So that I can provide details of my space
  I would like to add name, short description and price per night of my space
```

##  Initial Setup

- clone this repo
- run bundle 
- set up database


## To set up the database

Connect to `psql` and create the `makersbnb` and `makersbnb_test` database:

```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```
To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.


## User stories

```
Any signed-up user can list a new space.
A user can sign up
  As a potential user
  So that I can login in the future
  I would like to create an account

User can add a new space
  As a user
  So that I can rent out my space
  I would like to list a new space
  
Users can list multiple spaces.
  As a user
  So that I can list all my spaces
  I would like to be able to have multiple listings
  
Users should be able to name their space, provide a short description of the space, and a price per night.
  As a user
  So that I can provide details of my space
  I would like to add name, short description and price per night of my space
  
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
A guest is able to book a space
  As a user
  So that I can enjoy some time away from home
  I would like to book a space - (in progress)

The owner can approve/reject a booking
  As a user
  So that I can select the appropriate guest for my space
  I would like to review a booking request
```


## Database structure

Table: spaces
```
|------|--------|---------------|-----------|---------------|------------|
|  id  |  name  |  description  |   price   |  booked_by    |  owner_id  |
|------|--------|---------------|-----------|---------------|------------|
|  1   |  Loft  | "a nice loft" |     90    | FK request_id | FK user_id |
|------|--------|---------------|-----------|---------------|------------|
```
Table: users
```
|------|--------|------------------|-----------|
|  id  |  name  |  email           | password  |
|------|--------|------------------|-----------|
|  1   |  Tom   | test@example.com | secret    |
|------|--------|------------------|-----------|
```

Table: requests

```
|------|---------------------------|-------------|-----------|
|  id  |  requesting_user          |  space_id   | approved? |
|------|---------------------------|-------------|-----------|
|  1   |  FK user_id               | FK space_id | boolean   |
|------|---------------------------|-------------|-----------|
```

## Domain model


![Screenshot 2021-09-24 at 14 26 10](https://user-images.githubusercontent.com/87538271/134682064-e7700bfb-b0cf-44cd-baeb-42af064df43c.png)

