class HomeController < ApplicationController
  require "weather_api"

  def show
    if params[:city].present?
      @weather = Weather.new(params[:city])
      @weather.get_weather
    else
      flash[:warning] = "Please enter city name to find the weather info"
    end
  end
end
