class PostsController < ApplicationController
  require "mini_magick"
  protect_from_forgery except: :create # createアクションを除外
  before_action :authenticate_user

  def new
    @post = Post.new
  end

  def create
    post = Post.create! params.require(:post).permit(:title,:content,:image)
    redirect_to post
  end
  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update! params.require(:post).permit(:title,:content,:image)
    redirect_to post
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/admin")
  end
  def admin
    @posts = Post.all.order(created_at: :desc)
  end
end
