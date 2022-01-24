class UsersController < ApplicationController
  before_action :set_user

  def show
    @nickname = @user.nickname
    @posts = @user.posts.all.order(id: "ASC")
    @posts_count = @posts.count
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
