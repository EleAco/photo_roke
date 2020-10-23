class FavoritesController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    favorite = current_user.favorites.build(photo_id: params[:photo_id])
    favorite.save
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    favorite = Favorite.find_by(photo_id: params[:photo_id], user_id: current_user.id)
    favorite.destroy
  end
end
