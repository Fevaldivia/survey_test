class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
  end

  helper_method :current_user

  protected
    def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "testing123"
    end
  end
end
