class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order("created_at DESC")
    @favorite_photos = @user.favorite_photos
    # @photos = User.photos.order("created_at DESC")
  end

  def mypage
    @photos = current_user.photos.order("created_at DESC")
    @page_name ="マイページ"
  end

  # def follows
  #   user = User.find(params[:id])
  #   @users = user.followings
  # end

  # def followers
  #   user = User.find(params[:id])
  #   @users = user.followers
  # end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
end

def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
end

end