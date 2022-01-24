class UsersController < ApplicationController
  before_action :set_user

  def show
    @nickname = @user.nickname
    @posts_count = Post.count
    @posts = @user.posts.all.order(id: "ASC")
  end

  def followings
    @followings = @user.following_users
  end

  def followeds
    @followeds = @user.followed_users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
