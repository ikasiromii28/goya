class RelationshipsController < ApplicationController
  def create
    Relationship.create(followed_id: params[:follow_id], following_id: current_user.id)
    @user = User.find(params[:follow_id])
    redirect_to user_path(@user)
  end

  def destroy
    Relationship.destroy(followed_id: params[:follow_id], following_id: current_user.id)
    @user = User.find(params[:follow_id])
    redirect_to user_path(@user)
  end

end
