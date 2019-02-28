class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :update, :destroy]
  before_action :set_user

  def index
    json_response(@user.things)
  end

  def create
    thing = @user.things.create!(thing_params)
    json_response(thing);
  end

  def show
    json_response(@thing)
  end

  private

  def thing_params
    params.permit(
      :title,
      :details,
      :finishes_on,
      :image,
      :reminders,
    )
  end

  def set_user
    @user = User.find_by(email: @current_user.email)
  end

  def set_thing
    @thing = Thing.find(params[:thing_id])
  end
end
