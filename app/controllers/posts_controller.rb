# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create; end

  def index; end

  private

  def logged_in_user
    return if logged_in?

    flash.now[:danger] = 'Please log in to access the requested page'
    redirect_to login_path
  end
end
