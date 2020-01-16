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
      redirect_to new_post_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def logged_in_user
    redirect_to login_path unless logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
