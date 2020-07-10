## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `rake db:{create,migrate,seed}`
* When you run `bundle exec rspec`, you should have 16 examples, and 6 failing tests.
* You will also be starting with your db migrations, and seeds ready for you to use in development, and for you to use in your tests if you'd like.
* Do not get these to pass yet.
---

User Story 2 of 3
​
As a visitor,
When I visit the contestants index page ("/contestants")
I see a list of names of all the contestants
And under each contestants name I see a list of the projects (names) that they've been on
​
(e.g.   Kentaro Kameyama
        Projects: Litfit, Rug Tuxedo
​
        Jay McCarroll
        Projects: LeatherFeather)
```
​
```
User Story 3 of 3
As a visitor,
When I visit a project's show page
I see a count of the number of contestants on this project
​
(e.g.    Litfit
    Material: Lamp Shade
  Challenge Theme: Apartment Furnishings
  Number of Contestants: 3 )
```
​
