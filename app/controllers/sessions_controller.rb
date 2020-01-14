# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    render 'new'
    remember user
  end

  def destroy; end
end
