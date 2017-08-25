# WeatherApi
# Calls open weather api and returns a JSON response
# url_end_point could be weather, forecast, history etc.
# pass city name hash as the second argument

# ==== Examples
# WeatherApi.connect("weather", { q: "bangalore" })
# WeatherApi.connect("weather", { q: "berlin" })

require "net/http"
require "uri"

module WeatherApi
  BASE_URL = "http://api.openweathermap.org/data/2.5"
  API_KEY  = "1c861fb4ec35c263410ea07109242f9e"

  def self.connect url_end_point, params={}
    request_url = [BASE_URL, url_end_point].join("/")
    query_params = URI.encode_www_form(params.merge!({ appid: API_KEY }))
    uri = URI([request_url, query_params].join("?"))

    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
      JSON.parse(response.body)
    end
  end
end
