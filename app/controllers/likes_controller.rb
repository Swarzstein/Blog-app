# Purpose: Controller for likes
class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user_id: current_user.id, post_id: @post.id)

    redirect_to post_path(@post)
  end
end
