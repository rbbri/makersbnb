[![Build Status](https://travis-ci.com/rbbri/makersbnb.svg?branch=master)](https://travis-ci.com/rbbri/makersbnb)
[![Waffle.io - Columns and their card count](https://badge.waffle.io/rbbri/makersbnb.svg?columns=all)](https://waffle.io/rbbri/makersbnb)
[![Coverage Status](https://coveralls.io/repos/github/rbbri/makersbnb/badge.svg?branch=master)](https://coveralls.io/github/rbbri/makersbnb?branch=master)

## How to use ##

- Fork this repo
- Run `bundle install`
- To create the databases 'makersbnb_development' and 'makersbnb_test', run `rake db:create`
- Run `rake db:schema:load db:test:prepare`
- To launch the app from the command line use `rackup` and visit localhost:9292
- To run our tests, run rspec from the command line


## User stories ##
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

## Our approach ##

We are using Ruby and Sinatra to implement this project. The calendar uses the Pickadate package which required some JavaScript to be included in our program. We used rubocop to assess style and simplecov to assess our test coverage.

Our standards for completion were:
* 95% test coverage
* No linting issues with rubocop


## Plans for further development ##

* To send emails to users in the following situations
  - they sign up
  - create a space
  - they update a space
  - a user requests to book their space
  - a booking or request is made
* Users/owners can delete or edit requests/bookings
* To deploy to Heroku
* To *automatically* reject all booking which clash with a confirmed booking

## Contributors ##

Chris Cooksley (Learner5200)
Robin Johnson (rbbri)
Jude Lloyd-Jones (JL-J)
Imogen Misso (imogenmisso)
