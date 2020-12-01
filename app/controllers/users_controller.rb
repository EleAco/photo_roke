class UsersController < ApplicationController
  before_action :user_item, only: [:show, :following, :followers]

  def show
    @photos = @user.photos.order('created_at DESC')
    @favorite_photos = @user.favorite_photos
    @page_name = "#{@user.nickname}さんのページ"
  end

  def mypage
    @photos = current_user.photos.order('created_at DESC')
    @user = current_user
    @page_name = 'マイページ'
  end

  def following
    # @userがフォローしているユーザー 
    @users = @user.following
    @page_name = 'フォロー 一覧'
  end

  def followers
    # @userをフォローしているユーザー
    @users = @user.followers
    @page_name = 'フォロワー 一覧'
  end

  private

  def user_item
    @user = User.find(params[:id])
  end
end
