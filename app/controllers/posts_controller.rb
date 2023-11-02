class PostsController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :create]
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
