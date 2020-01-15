# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash.now[:success] = 'Successfully logged in'
      redirect_to :root
    else
      flash.now[:danger] = 'Error! Wrong combination of email and password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'Successfully logged out'
    redirect_to root_path
  end
end
