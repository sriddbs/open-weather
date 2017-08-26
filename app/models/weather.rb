require "net/http"
require "uri"
require "temparature"

class Weather
  attr_accessor :weather_api_response, :city, :country_code, :description, :current_temp, :max_temp, :min_temp, :humidity, :wind_speed, :clouds, :lat, :lng,
    :error_message

  def initialize city
    @weather_api_response = nil
    @city = city
  end

  def get_weather
    @weather_api_response = WeatherApi.connect("weather", { q: @city })
    if @weather_api_response["cod"] == "404" || @weather_api_response["cod"] == "400"
      @error_message = @weather_api_response["message"]
    else
      set_weather_attributes
    end
  end

  def set_weather_attributes
    weather = @weather_api_response["weather"].first
    @country_code = @weather_api_response["sys"]["country"]
    @description = weather["description"]
    @current_temp = Temparature.in_celsius("kelvin", @weather_api_response["main"]["temp"])
    @max_temp = Temparature.in_celsius("kelvin", @weather_api_response["main"]["temp_max"])
    @min_temp = Temparature.in_celsius("kelvin", @weather_api_response["main"]["temp_min"])
    @humidity = @weather_api_response["main"]["humidity"]
    @wind_speed = @weather_api_response["wind"]["speed"]
    @clouds = @weather_api_response["clouds"]["all"]
    @lat = @weather_api_response["coord"]["lat"]
    @lng = @weather_api_response["coord"]["lon"]
  end
end
