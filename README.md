Any signed-up user can list a new space.
Users can list multiple spaces.
Users should be able to name their space, provide a short description of the space, and a price per night.
Users should be able to offer a range of dates where their space is available.
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
Nights for which a space has already been booked should not be available for users to book that space.
Until a user has confirmed a booking request, that space can still be booked for that night.

## MVP


  As a user
  So that I can browse in the app
  I would like to see a list of spaces
 
  As a user
  So that I can rent out my space
  I would like to list a new space
  
  As a user
  So that I can provide details of my space
  I would like to add name, short description and price per night of my space


# User stories

```
Any signed-up user can list a new space.
1: signed-up user
  As a potential user
  So that I can login in the future
  I would like to create an account (sign-up) - done

2: list a new space
  As a user
  So that I can rent out my space
  I would like to list a new space - (done)
  
Users can list multiple spaces.
  As a user
  So that I can list all my spaces
  I would like to be able to have multiple listings - (to do)
  
Users should be able to name their space, provide a short description of the space, and a price per night.
  As a user
  So that I can provide details of my space
  I would like to add name, short description and price per night of my space - (done)
  
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
1: guest able to book a space
  As a user
  So that I can enjoy some time away from home
  I would like to book a space - (in progress)

2: the host approving/rejecting a booking
  As a user
  So that I can select the appropriate guest for my space
  I would like to review a booking request
```




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



![Screenshot 2021-09-24 at 14 26 10](https://user-images.githubusercontent.com/87538271/134682064-e7700bfb-b0cf-44cd-baeb-42af064df43c.png)

