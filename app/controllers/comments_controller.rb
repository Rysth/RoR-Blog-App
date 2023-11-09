class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @author = User.find(params[:user_id])
    # Redirection purposes
    @post = Post.find(params[:post_id])
    @comment = @user.comments.build(comment_params)
    if @comment.save
      redirect_to user_post_path(user_id: @author.id, id: @post.id)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @comment.user
    @author = User.find(params[:user_id])
    return unless @comment.destroy

    redirect_to user_post_path(user_id: @author.id, id: @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: @post.id)
  end
end
