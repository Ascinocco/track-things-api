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

  def update
    updated_user_data = {}

    name = user_params[:name]
    email = user_params[:email]

    if name and @current_user.name != name
      updated_user_data[:name] = name
    end

    if email and @current_user.email != email
      emailTaken = User.find_by(email: email)
      if emailTaken
        return json_response({ message: Message.email_in_use })
      else
        updated_user_data[:email] = email
      end
    end

    password = user_params[:password]

    if password
      password_confirmation = user_params[:password_confirmation]
      if password == password_confirmation
        updated_user_data[:password] = password
      else
        return json_response({ message: Message.passwords_do_not_match })
      end
    end

    if !updated_user_data.empty?
      @current_user.update(updated_user_data)
    end

    head :no_content
  end

  def destroy
    @current_user.destroy
    head :no_content
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
