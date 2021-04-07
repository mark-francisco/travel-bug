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

    # SESSIONS
    post "/sessions" => "sessions#create"
  end
end
