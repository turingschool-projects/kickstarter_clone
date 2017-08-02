# RollingPunches
![alt text](http://imgur.com/a/p2gT4)
![alt text](http://imgur.com/a/Qok69)
## Description

This is a [Kickstarter](https://www.kickstarter.com/) clone. Users can create a project, browse other projects, and they can back a project if they so desire. The user can browse projects by categories, and from there can filter the categories by specific parameters. This project uses two factor authentication with twilio when a user logs in. When the user is updating a location for a project they create the fields are autofilled with geolocate from the google places API.

## Stack

This site is built with Javascript, SASS, CSS, Postgresql, Rails 5.1.2, Ruby version 2.4.1, Google Places API, & Twilio API.

## Schema

Here's a look at the relationships in our database:

![alt text](http://imgur.com/a/bCl1v)

##Heroku
  * [Visit us on Heroku](https://ks-clone.herokuapp.com/)

## Local Install

  ### You Need:
  * [Rails version 5.1](http://installrails.com/)

  * [Ruby version 2.4.1](https://www.ruby-lang.org/en/documentation/installation/)

To run locally:
  * clone this repo.
  * cd into it
  * ```bundle```
  * ```bundle exec figaro install```
  * There are several required environmental variables. Ask project contributors for required values to add into application.yml.
  * ```rake db:setup```
  * ```rake db:seed```
  * ```rails assets:precompile```
  * ```rails server```
  * go to ```localhost:30000``` and click on a project.

## Testing Suite
  * ```rspec```

##Contributors
[Sarah Kirk](https://github.com/sarahdactyl71)
[Nick Edwards](https://github.com/nickedwards109)
[Ben Ross](https://github.com/Benja-Ross)
[Tom Soucie](https://github.com/TomSoucie)
[William Thomas](https://github.com/wthoma22)
