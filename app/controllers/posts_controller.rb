class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(params[:post].permit(:title, :body))
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
    @post.user = current_user
  end

  def show
    @post = Post.find(params[:id])
  end
end
