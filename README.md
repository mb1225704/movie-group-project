# Dope Movie Reviews

Welcome to Dope movie reviews! Reviewers get to decide how dope movies are. You can visit any of the movies in our catalog and review them. Simply click a movie on the home page to see more information about the movie and add a review

## Approach
### Technology
- We built this website using react and rails. As a general rule, pages should be built in react unless there is a good reason not to. Although there are several rails pages, the direction of this app is moving heavily toward react
- All endpoints are serialized and should continue to be unless there is a good reason not to

### Features to consider moving forward
- Refactor to move most/all features to react
- Build search bar on the homepage
- Add database tables for things like genre, rating, etc.
- Add filters
- Populate movies database using an API (imdb was recommended by our group)

## Pages/templates

### Index
#### Technology: Rails
The index page is controller in app/controllers/movies_controller.rb 

#### User interaction
It returns all movies in alphabetic order (the is included) along with some information about the movie.

### Sign up/sign in pages
#### Technology: Rails and Devise (through make_it_so)
We are using an implementation of devise generated through the make_it_so gem https://github.com/LaunchAcademy/make_it_so. 

There are some custom database fields for things like first/last name, profile pic, etc. These custom values and form fields have been added to both the database and the form

We are managing image upload and storage of profile pictures through carrier wave and an Amazon s3 bucket. See external resources for more about the implementation as we applied a standard implementation for each

All functionality for PW reset, account editing, and account creation is handled through make_it_so's default implementation

#### User interaction
Users are able to login, log out, sign up, change account information, and delete their account through form pages. Taking these actions are built in a self contained workflow that is accessible primarily through the links in the header

### Show page & General react usage
#### Technology: React and Rails endpoints
ALL ENDPOINTS ARE SERIALIZED!

Most of the react components in this application get their information via endpoints in the app/controllers/api/v1 folder. Most all links within react components send routes through a BrowserRouter. 

There is one exception to this rule. See the NewReviewForm component. If the user prop is empty, it sends the user to a rails page using the `window.location.pathname = ${path}` format.

Note that all react (and rails pages for that matter) are wrapped in a div with the class of content section. When editing the overall layout of the page's body, you might want to see this section

```
// app/views/layouts/application.html.erb

  <div class="content-section">
    <%= yield %> //page body (not html body) rendered here
  </div>

```

#### User interaction

When the user visits a show page, there is, upon initial release, one action they can take. That action is to review the movie they are currently on. If the user is not logged in, this takes them to the login page. The user can still interact with everything in the header

Show page displays information about each movie with a review section under it. The review section displays the review title, body(optional), and the user that submitted

### New review form
##### Technology: React and Rails endpoints
Form submits a post request to the database in the event that the form passes the react validations (react valid conditions are the same as the database and model validations)

#### User interaction
The user fills out the form and, in the event that is passes the validation, is sent back to the movie show page. There is no review show page at the point of initial release

React form validations will stop all invalid submissions

## Credits
### Core Project Team
- @gieringj
- @jHid04
- @mb1225704
- @jonpekk

### Project Mentors/Villainous PR reviewers
- @nwalberts
- @dovakeen118