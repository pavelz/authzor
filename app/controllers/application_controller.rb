class ApplicationController < ActionController::API
  def current_user
    if session[:email].present?
      @current_user ||= User.load(session[:email])
    else
      @current_user = nil
    end
  end
end
