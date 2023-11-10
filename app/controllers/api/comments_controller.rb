class Api::CommentsController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_post, only: [:index, :create]

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
       render json: @comment
    else
      render json: @comment.errors
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
