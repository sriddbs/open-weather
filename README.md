# README

# Objective

A simple weather app to display the current weather in a given location to the user.

This app uses Open Weather Map JSON API (http://openweathermap.org/API) to get real weather data.

The app should:

- be able to display the weather at random geographic locations
- have a form with city and country that fetches and displays the weather in this city
  - optionally: cache the fetched weather data
- gracefully handle the case where the city could not be found (display the information to the user)

# Development Environment

* Ruby 2.2.2

* Rails 5.0

* Ubuntu 16.04

* RSpec, Cucumber

# Workflow

  On the home page is a form/textbox where the user can enter city and country code to get the current weather information

# Tests

* bundle exec rspec
* bundle exec cucumber
