module Response
  def json_response(object, state = :ok)
    render json: object, status: status
  end
end
