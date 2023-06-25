# Purpose: Controller for likes
def create
  @like = Like.new(like_params)
  @like.user = current_user
  @like.save
  redirect_to post_path(@like.post)
end