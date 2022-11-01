class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id).includes(:comments).order(created_at: :desc)
  end

  def new
    @current_user = current_user
    @post = Post.new
    @user = User.find(params[:user_id].to_i)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    @user = current_user

    if @post.save
      redirect_to user_post_path(@user, @post)
      flash[:error] = 'Post successfuly created!'
    else
      flash[:error] = 'Error creating post'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id:@post.id).includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
