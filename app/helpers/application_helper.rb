module ApplicationHelper
  def weather_info_html weather
    return "" if weather.blank?
    if weather.error_message.present?
      content_tag(:div, nil, class: "alert alert-info") do
        concat(content_tag(:div, weather.error_message, id: "city-not-found"))
      end
    else
      current_temp = weather.current_temp
      temp_range = "temparature from #{weather.min_temp} to #{weather.max_temp}"
      secondary_info = "humidity #{weather.humidity} wind #{weather.wind_speed} m/s clouds #{weather.clouds}"
      co_ords = [weather.lat, weather.lng].join(", ")

      content_tag(:div, nil, class: "alert alert-success weather-info") do
        concat(content_tag(:div, [[weather.city, weather.country_code].join(", "), weather.description].join(" "), class: "weather-main"))
        concat(content_tag(:div,
          content_tag(:span, current_temp, class: "badge badge-pill badge-secondary curr-temp").
          concat(content_tag(:span, [temp_range, secondary_info].join(", "), class: "weather-secondary-info")),
        ))
        concat(content_tag(:div, "Co-ordinates #{co_ords}", class: "geo-coords"))
      end
    end
  end
end
