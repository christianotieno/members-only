# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash.now[:success] = 'Success you are now logged in'
      redirect_to :root
    else
      flash.now[:danger] = 'Error Wrong combination of email and password'
      render 'new'
    end
  end

  def destroy
    sign_out if logged_in?
    redirect_to :root
  end
end
