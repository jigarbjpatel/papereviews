Name of application: papereviews

Description: It is an online paper review management system

HEROKU URL for the project -> http://thawing-springs-5462.herokuapp.com/users/sign_in

The two Models in this application are
1. User
2. Review (i.e. paper review)

Relationship - user has many reviews and a review belongs to one user

Features working
1. User sign in, sign out, sign up
2. Review listing, creation, deletion (using ajax), edit and view
3. Search review (using ajax)
4. Review as REST API - /reviews.xml and /reviews.json

Test cases
1. Not all code is covered but there are total 55 test cases across both models and requests. 
2. Used the concept of RSpec, Capybara, FactoryGirl and support specs. 
