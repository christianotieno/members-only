# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      flash.now[:notice] = 'Post created successfully.'
      redirect_to root_path
    else
      flash.now[:error] = 'Post creation not successful, include a title/content.'
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def logged_in_user
    return if logged_in?

    flash.now[:danger] = 'Please log in to access the requested page'
    redirect_to login_path
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
