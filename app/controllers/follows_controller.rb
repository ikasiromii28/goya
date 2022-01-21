class FollowsController < ApplicationController
  before_action :set_user

  def create
    Relationship.create(followed_id: params[:follow_id], following_id: current_user.id)
    redirect_to user_path(@user)
  end

  def destroy
    Relationship.destroy(followed_id: params[:follow_id], following_id: current_user.id)
    redirect_to user_path(@user)
  end

  private

  def 

  def set_user
    @user = User.find(params[:follow_id])
  end
end
