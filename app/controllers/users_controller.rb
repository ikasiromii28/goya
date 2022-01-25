class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = if user_signed_in?
               User.where.not(id: current_user.id)
             else
               User.all.order(nickname: 'desc')
             end
  end

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
