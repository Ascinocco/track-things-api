# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    email = auth_params[:email]
    password = auth_params[:password]
    auth_token = AuthenticateUser.new(email, password).call
    user = User.find_by(email: email)

    json_response({
      user: {
        **user.get_sanitized_user,
        auth_token: auth_token
      },
    }, :accepted)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
