Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#show"

  get "/find_weather(/:city_name)" => "home#show", as: :find_weather
end
