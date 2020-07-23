class UsersController < ApplicationController

  def create
    user  = User.new(email: params[:email], password: params[:password])

    if User.load(params[:email])
      render json: {status: "user already exists"}, status: :unauthorized
      return
    end

    if user.save
      render json: {status: "success"}, status: :ok
    else
      render json: user.errors, status: :unauthorized # validation errors.
    end
  end

  def update
    user = User.load(params[:email])

    if user.present? && session[:email].present? && session[:email] == params[:email]
      user.password = params[:password]
      if user.save
        render json: {status: "success"}, status: :ok
      else
        render json: {status: "failed"}, status: :unauthorized
      end
    else
        render json: {status: "log in fisrt"}, status: :unauthorized
    end
  end
end
