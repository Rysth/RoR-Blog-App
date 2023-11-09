class Api::CommentsController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_post, only: [:index]

  def index
    @comments = @post.comments
    render json: @comments
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:post_id])
  end

end
