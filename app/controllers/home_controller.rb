class HomeController < ApplicationController
  def top
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
  end
end
