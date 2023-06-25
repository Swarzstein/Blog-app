#controller for comments
def create
  @comment = Comment.new(comment_params)
  @comment.user = current_user
  @comment.post = Post.find(params[:post_id])
  if @comment.save
    redirect_to post_path(@comment.post)
  else
    render 'posts/show'
  end
end