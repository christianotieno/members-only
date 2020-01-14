# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    log_in user
    remember user
    render 'new'
  end

  def destroy
    sign_out
  end
end
