class HomeController < ApplicationController
  require "weather_api"

  def show
    if params[:city]
      @response = WeatherApi.connect("weather", { q: params[:city] })
      puts @response
    end
  end
end
