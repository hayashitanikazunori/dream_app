class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to "/posts" 
    else
      flash.now[:alert] = "投稿に失敗しました"
      render("posts/new")
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update params.require(:post).permit(:comment, image: [])
    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "削除しました"
      redirect_to "/posts"
    else
      flash.now[:alert] = "削除に失敗しました"
      render("posts/#{params[:id]}")
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :comment)
  end
end
