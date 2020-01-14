# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def sign_in(user)
    new = User.create_token
    user.remember = new_token
    cookies.permanent[:remember_token] = new
    get_current_user
  end

    def current_user
        User.find_by(remember_token: cookies[:remember_token])
    end

    def get_current_user
        @current_user ||= current_user
    end


  # def sign_in(user)
  #   cookies.permanent[:remember] = user.remember
  # end

  # def curren_user
  #   @current_user = User
  # end

  # def current_user
  #   remember = User.remember_digest(cookies[:remember])
  #   @current_user ||= User.find_by(cookies[:remember] if cookies[:remember])
  # end



end
