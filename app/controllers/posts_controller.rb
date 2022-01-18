class PostsController < ApplicationController
  def index
    @posts = Post.all.order('date DESC')
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:kibun, :date)
  end
end
