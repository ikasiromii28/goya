class UsersController < ApplicationController
  before_action :set_user

  def show
    @nickname = @user.nickname
    @posts = if params[:sort_update]
               @user.posts.by_recently_created
             else
               @user.posts.all.order(date: 'ASC')
             end
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
