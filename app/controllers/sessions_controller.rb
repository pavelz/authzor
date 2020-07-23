class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.load(params[:email])
    if user.present? && user.authenticate_password(params[:password])
      session[:email] = user.email
      render json: {status: 'logged in'}, status: :ok
    else
      session.delete(:email)
      render json: {status: 'login failed'}, status: :unauthorized
    end
  end

  def destroy
    email = session.delete(:email)
    render json:  email.present? ? {email: 'is logged out'} : 'not logged in', status: email.present? ? :ok : :unauthorized
  end
end
