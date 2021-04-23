Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    # USERS
    # Sign Up for app
    post "/users" => "users#create"
    # see all Users to add to Trip
    get "/users" => "users#index"
    # show own User portal
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    # SESSIONS
    post "/sessions" => "sessions#create"

    # DESTINATIONS
    get "/destinations" => "destinations#index"

    # STOPS
    get "/stops" => "stops#index"
    get "/stops/:id" => "stops#show"
    post "/stops" => "stops#create"
    patch "/stops/:id" => "stops#update"
    delete "/stops/:id" => "stops#destroy"

    # TRIPS
    get "/trips" => "trips#index"
    get "/trips/:id" => "trips#show"
    post "/trips" => "trips#create"
    patch "/trips/:id" => "trips#update"
    delete "/trips/:id" => "trips#destroy"
  end
end
