require "rails_helper"

RSpec.describe "weather", type: :model do
  it "initializes api response and city" do
    weather = Weather.new("Amsterdam")

    expect(weather.city).to eq("Amsterdam")
    expect(weather.weather_api_response).to eq(nil)
  end

  it "sets weather attributes from api response" do
    weather = Weather.new("Amsterdam")
    weather.get_weather
    api_response = weather.weather_api_response

    expect(weather.city).to eq(api_response["name"])
    expect(weather.country_code).to eq(api_response["sys"]["country"])
    expect(weather.current_temp).to eq(Temparature.in_celsius("kelvin", api_response["main"]["temp"]))
    expect(weather.max_temp).to eq(Temparature.in_celsius("kelvin", api_response["main"]["temp_max"]))
    expect(weather.min_temp).to eq(Temparature.in_celsius("kelvin", api_response["main"]["temp_min"]))
    expect(weather.humidity).to eq(api_response["main"]["humidity"])
    expect(weather.wind_speed).to eq(api_response["wind"]["speed"])
    expect(weather.clouds).to eq(api_response["clouds"]["all"])
    expect(weather.lat).to eq(api_response["coord"]["lat"])
    expect(weather.lng).to eq(api_response["coord"]["lon"])
  end
end
