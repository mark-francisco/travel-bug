class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    # "user.authenticate" method provided by "bcrypt" gem
    if user && user.authenticate(params[:password])
      # "JWT.encode" provided by "jwt" gem
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render :json => { :jwt => jwt, :email => user.email, :user_id => user.id }, status: :created
    else
      render :json => { :message => "Unable to log in." }, status: :unauthorized
    end
  end
end
