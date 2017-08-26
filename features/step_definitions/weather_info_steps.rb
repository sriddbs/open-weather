Given(/^the search form to enter city and country$/) do
  visit root_path
end

When(/^I enter the city and\/or country name$/) do
  fill_in "city", with: "Bangalore, IN"
  click_button("search")
end

Then(/^the application should display the weather info in the given city and country$/) do
  weather = Weather.new("Bangalore, IN")
  weather.get_weather

  find(:xpath, '//div[@class="weather-main"]').should have_content([[weather.city, weather.country_code].join(", "), weather.description].join(" "))
  find(:xpath, '//div[@class="geo-coords"]').should have_content([weather.lat, weather.lng].join(", "))
end
