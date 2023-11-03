class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    # Redirection purposes
    @post = Post.find(params[:post_id])
    @comment = @user.comments.build(comment_params)
    if @comment.save
      redirect_to user_post_path(@user, id: @post.id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: @post.id)
  end
end
