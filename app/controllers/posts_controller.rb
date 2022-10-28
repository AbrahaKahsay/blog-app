class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to user_post_path(current_user.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to new_user_post_path
    end
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
