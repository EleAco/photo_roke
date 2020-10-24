class RelationshipsController < ApplicationController
  # def create
  #   follow = current_user.active_relationships.build(follower_id: params[:user_id])
  #   follow.save
  #   redirect_to user_path
  # end

  # def destroy
  #   follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  #   follow.destroy
  #   redirect_to user_path
  # end

  def create
    @user = User.find(params[:following_id])
    current_user.follow(@user)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
  end


end
