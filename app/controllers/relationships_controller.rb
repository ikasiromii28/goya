class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(followed_id: params[:user_id], following_id: current_user.id)
    redirect_to user_path(params[:user_id]) if relationship.save
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to user_path(params[:user_id])
  end
end
