class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @photos = user.photos.order("created_at DESC")
    # @photos = User.photos.order("created_at DESC")
    @page_name = "マイページ"
  end

  def mypage
    @photos = current_user.photos.order("created_at DESC")
    @page_name ="マイページ"
  end

end