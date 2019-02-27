# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # POST /signup
  # return authenticated token upon signup
  def create
    if (user_params[:password] != user_params[:password_confirmation])
      return json_response({ message: Message.passwords_do_not_match }, :bad_request)
    end

    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {
      message: Message.account_created,
      user: {
        **user.get_sanitized_user,
        auth_token: auth_token
      }
    }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
