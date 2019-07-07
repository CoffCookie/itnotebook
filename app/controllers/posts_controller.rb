class PostsController < ApplicationController
  require "mini_magick"
  protect_from_forgery except: :create # createアクションを除外
  before_action :authenticate_user

  def new
  end
  def image

  end
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/")
  end
  def image_create
    if params[:image]
      @image = Image.new(image_name: params[:image].original_filename)
      @image.save

      File.binwrite("public/post_image/#{@image.image_name}",params[:image].read)
      @image_tag = %Q[<img src="post_image/#{@image.image_name}">]

      image_resize = MiniMagick::Image.open("public/post_image/#{@image.image_name}")
      image_resize.resize "300x300"
      image_resize.format "jpg"
      image_resize.write "public/post_image/#{@image.image_name}"


      redirect_to("/posts/image",flash: {image_tag: @image_tag})
    end
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
    if params[:image]
      @post.image_name = params[:image].original_filename
      image = params[:image]
      File.binwrite("public/post_image/#{@post.image_name}",image.read)
    end
    @post.save
    redirect_to("/")
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/admin")
  end
end
