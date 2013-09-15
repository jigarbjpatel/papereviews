Name of application: papereviews
Description: It is an online paper review management system
Andrew Id: jjpatel

HEROKU URL for the project -> http://thawing-springs-5462.herokuapp.com/users/sign_in
GIT HUB URL for project -> https://github.com/jigarbjpatel/papereviews.git

The two Models in this application are
1. User
2. Review (i.e. paper review)

Relationship - user has may reviews and a review belongs to one user

Features completed in this iteration
1. User Model and Login, logout, sign up functions (all using devise gem)
2. Review Model and associated CRUD operations (index, new, edit, delete, show) with basic views and validations

Planned for next week release
1. Ajax operation - search using paper title and author, pagination on view page (and sorting if time permits)
2. Allowing users to add links to paper and paper reviews
3. Adding date validation and using proper date input controls
4. Allowing users to upload files (paper and review)
5. If possible, allowing users to use rich text editor for entering comments
6. Refactor esp. formatting of code

