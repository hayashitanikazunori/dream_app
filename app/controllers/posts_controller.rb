class PostsController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]
before_action :current_uzer_authenticate, only: [:edit, :destroy, :update]

  def index
    @posts = Post.all
    @favolites = Favolite.new
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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
    @post = Post.find_by(params[:id])
    @post.update(post_params)
    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    @post = Post.find_by(params[:id])
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

  def current_uzer_authenticate
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts")
    end
  end
end
