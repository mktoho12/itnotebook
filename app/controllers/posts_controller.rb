class PostsController < ApplicationController
  require "mini_magick"
  protect_from_forgery except: :create # createアクションを除外
  before_action :authenticate_user

  def index
    @posts = Post.all.order created_at: :desc
  end

  def create
    post = Post.create! params.require(:post).permit(:title, :content, :image)
    redirect_to post
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update! params.require(:post).permit(:title, :content, :image)
    redirect_to post
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/admin")
  end

  def image
  end

  def image_create
    if params[:image]
      @image = Image.new(image: params[:image].original_filename)
      @image.save

      File.binwrite("public/post_image/#{@image.image}",params[:image].read)
      @image_tag = %Q[<img src="post_image/#{@image.image}">]

      image_resize = MiniMagick::Image.open("public/post_image/#{@image.image}")
      image_resize.resize "300x300"
      image_resize.format "jpg"
      image_resize.write "public/post_image/#{@image.image}"


      redirect_to("/posts/image",flash: {image_tag: @image_tag})
    end
  end

  def admin
    @posts = Post.all.order(created_at: :desc)
  end

end
