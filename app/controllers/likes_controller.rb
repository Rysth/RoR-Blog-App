class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(user: @user, post: @post)
    return unless @like.save

    redirect_to user_post_path(@user, id: @post.id)
  end
end
