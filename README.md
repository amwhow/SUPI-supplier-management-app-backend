# SUPI - A supplier management system
Site Link: https://supi.netlify.app/.  
This is the backend server for the SUPI project. Please see below the repo for the front end:  
https://github.com/amwhow/SUPI-supplier-management-app-frontend  

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies) 

## General info
A supplier management system for businesses in the catering industry. We hope that with this app, businesses will be able to visualise supplier performance, upcoming tasks and payments, and then help with making better operational choices.

## Technologies
* Ruby
* Ruby on Rails
* PostgreSQL
* Heroku
* AWS S3

## Usage
* Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/), [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) and [bundler](https://bundler.io/)
* Clone this repo to your desktop, cd to the root directory and then run `bundle install` to install all dependencies.  
* Once the dependencies are installed, you can run `rails s` to start the back-end server. The app will be deploy at localhost:3000 as default. The backend urls are set in the .env.development and .env.production files respectively.  
* Check the cors.rb file and make sure your front end url is listed after the `origins` statement.  

