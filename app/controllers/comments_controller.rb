# controller for comments
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comments.new(post_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      redirect_to user_post_comment_path(@post.author_id, @post.id, @comment.id)
    end
  end
end
