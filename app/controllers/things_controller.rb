class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :update, :destroy]

  def index
    json_response(@current_user.things)
  end

  def show
    json_response(@thing)
  end

  def create
    thing = @current_user.things.create!(thing_params)
    json_response(thing);
  end

  def update
    @thing.update(thing_params)
    head :no_content
  end

  def destroy
    @thing.destroy
    head :no_content
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

  def set_thing
    thing = Thing.find_by id: params[:id], created_by: @current_user.id
    if !thing
      return json_response({ message: Message.unable_to_retrieve_record })
    end

    @thing = thing
  end
end
