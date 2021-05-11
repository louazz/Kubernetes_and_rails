class PostsController < ApplicationController
  before_action :current_post, only: [:show, :edit, :update, :destroy]
 
  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
    @post.author= current_user.email
    @post.avatar.attach(params[:avatar])
  end

  def create
    post = Post.create(post_params)
    
    redirect_to post_path(post)
  end

  def edit

  end

  def update
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit( :content, :title, :avatar)
    
  end
  def current_post
    @post = Post.find(params[:id])
  end
end
