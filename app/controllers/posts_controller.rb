class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @user = current_user
    if user_signed_in?
      @post = @user.posts.new(post_params)
      if @post.save
        flash[:notice] = "Post created."
        redirect_to posts_path
      else
        flash[:alert] = "Post not created."
        byebug
        redirect_to root_path
      end
    else
      flash[:alert] = "You must be signed in to post."
      redirect_to new_user_session_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    byebug
    @user = current_user
    @post.destroy
    redirect_to show_user_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
