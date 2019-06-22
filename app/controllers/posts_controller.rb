class PostsController < ApplicationController
  protect_from_forgery except: :create # createアクションを除外
  before_action :authenticate_user

  def new
  end
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/")
  end
  def edit
    @post = Post.find_by(id: params[:id])
  end
  def admin
    @posts = Post.all.order(created_at: :desc)
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/")
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/admin")
  end
end
