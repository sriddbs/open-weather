require "spec_helper"
require_relative "../lib/weather_api"

RSpec.describe "weather_api" do
  it "calls open weather api" do
    expect(WeatherApi::BASE_URL).to eq("http://api.openweathermap.org/data/2.5")
  end

  it "returns error message when no city name is provided" do
    response = WeatherApi.connect("weather", { q: "" })

    expect(response["cod"]).to eq("400")
    expect(response["message"]).to eq("Nothing to geocode")
  end

  it "returns city not found when an invalid city name is provided" do
    response = WeatherApi.connect("weather", { q: "aaaaaaaaaaaaaaaaaaaaa" })

    expect(response["cod"]).to eq("404")
    expect(response["message"]).to eq("city not found")
  end

  it "should return JSON response of weather info for a given city" do
    response = WeatherApi.connect("weather", { q: "Bangalore" })

    expect(response["cod"]).to eq(200)
    expect(response["name"]).to eq("Bangalore")
    expect(response["sys"]["country"]).to eq("IN")
  end
end
