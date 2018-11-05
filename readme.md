## How to use ##

- Fork this repo
- Run `bundle install`
- If you do not already have the databases 'makersbnb_development' and 'makersbnb_test', run `rake db:create`
- Run `rake db:migrate db:test:prepare`
- To launch the app from the command line use `rackup` and visit localhost:9292


## User Stories ##
```
As a user
So I can use the site
I would like to be able to create an account

As a user,
So can find someone to rent my space
I would like to be able to list a new space

As a user,
So I can rent out more than one space,
I would like to be able to list multiple spaces

As a user,
So that I can manage my spaces
I want to be able to give each space a name, description and price

As a user
So that I can manage bookings
I want to be able to list available dates

As a user
So that I can rent a space
I would like to be able to request a booking

As a user
So that I can ensure I don't have multiple bookings
I would like to be able to confirm booking requests

As a user
So that I can avoid having bookings that clash
I would like the property to be made unavailable when booked

As a user
So that I can choose who to rent my space to
I would like spaces to still be available until a booking is confirmed
```

## Our Approach ##

We are using Ruby and Sinatra to implement this project. We will use rubocop to assess style, simplecov to assess our test coverage and flog to assess the complexity of our code.

Our definition of done:
* 95% test coverage
* No linting issues with rubocop
* Methods with a flog complexity under 6
* Classes with a flog complexity under 15
