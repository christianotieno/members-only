# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #user = User.find_by(params[:email])
    if(user && user.authenticate(params[:password]))

    sign_it(user)
    remember_to user
    flash[:success] = "Welcome"
    else
      flash.now[:success] = "Hello"
  end
end

  def destroy
    sign_out
  end
end
