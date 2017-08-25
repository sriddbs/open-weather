Feature: Open Weather
  As a user
  I want to find the weather in my city

Scenario: Finding weather in my city from the home page
  Given the search form to enter city and country
  When I enter the city and/or country name
  Then the application should display the weather info in the given city and country
