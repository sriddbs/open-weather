module ApplicationHelper
  require 'temparature'

  def weather_info_html response
    return "" if response.blank?
    if response["cod"] == "404"
      content_tag(:div, nil, class: "alert alert-info") do
        concat(content_tag(:div, "Oops! Could not find weather data", id: "city-not-found"))
      end
    else
      city_name = [response["name"], response["sys"]["country"]].join(", ")
      weather = response["weather"].first

      current_temp = Temparature.in_celsius("kelvin", response["main"]["temp"])
      temp_info = "temparature from #{Temparature.in_celsius("kelvin", response["main"]["temp_min"])} to
        #{Temparature.in_celsius("kelvin", response["main"]["temp_max"])}"
      secondary_info = "humidity #{response["main"]["humidity"]} wind #{response["wind"]["speed"]} m/s clouds #{response["clouds"]["all"]}"
      co_ords = [response["coord"]["lat"], response["coord"]["lon"]].join(", ")

      content_tag(:div, nil, class: "alert alert-success weather-info") do
        concat(content_tag(:div, [city_name, [weather["main"], weather["description"]]].join(" "), class: "weather-main"))
        concat(content_tag(:div,
          content_tag(:span, current_temp, class: "badge badge-pill badge-secondary curr-temp").
          concat(content_tag(:span, [temp_info, secondary_info].join(", "), class: "weather-secondary-info")),
        ))
        concat(content_tag(:div, "Co-ordinates #{co_ords}", class: "geo-coords"))
      end
    end
  end
end
