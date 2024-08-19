class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      redirect_to posts_path, notice: 'Post criado com sucesso!'
    else
      render :new, status: 401
    end
  end

  private

  def post_params
    params.require(:post).permit(:photo, :subtitle)
  end
end
