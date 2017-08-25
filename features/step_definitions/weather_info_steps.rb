Given(/^the search form to enter city and country$/) do
  visit root_path
end

When(/^I enter the city and\/or country name$/) do
  fill_in "city", with: "Bangalore, IN"
  click_button("search")
end

Then(/^the application should display the weather info in the given city and country$/) do
  response = WeatherApi.connect("weather", { q: "Bangalore, IN" })
  city_name = [response["name"], response["sys"]["country"]].join(", ")
  weather = response["weather"].first

  find(:xpath, '//div[@class="weather-main"]').should have_content([city_name, [weather["main"], weather["description"]]].join(" "))
  find(:xpath, '//div[@class="geo-coords"]').should have_content([response["coord"]["lat"], response["coord"]["lon"]].join(", "))
end
