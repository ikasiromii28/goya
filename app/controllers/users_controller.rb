class UsersController < ApplicationController
  before_action :set_user, except: [:index, :search]

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
               @user.posts.all.order(date: 'desc')
             end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def followings
    @followings = @user.followed_users
  end

  def followeds
    @followeds = @user.following_users
  end

  def search
    @users = User.search(params[:keyword])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :birthday)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
