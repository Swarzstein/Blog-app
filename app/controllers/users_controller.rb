class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
    #take the active session id
    @session_id = session[:session_id]
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.most_recent_posts
  end
end

  # def new
  #  @user = User.new
  # end

  # def create
  #  @user = User.create(params[:user])
  #  if @user.save
  #    redirect_to user_path(@user.id)
  #  else
  #    render :new
  #  end
  # end
