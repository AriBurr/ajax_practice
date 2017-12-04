class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_error(model)
    render json: model.errors.full_messages, status: :bad_request
  end

end
