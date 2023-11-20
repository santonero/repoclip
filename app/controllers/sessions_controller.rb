class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_by(email: params[:account], password: params[:password]) || user = User.authenticate_by(username: params[:account], password: params[:password])
      login user
      flash[:notice] = "Logged in."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:notice] = "Logged out."
  end
end
