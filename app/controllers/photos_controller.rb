class PhotosController < ApplicationController
  before_action :move_to_index
  
  def index
    @photo = Photo.all.order('created_at DESC')
  end

  def new
    @photo = Photo.new
    @page_name ='投稿ページ'
  end

  def create
    @photo = Photo.new(photo_params)
      if @photo.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @comments = @photo.comments.includes(:user)
  end



  private

  def photo_params
    params.require(:photo).permit(:image, :explanation).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to controller: :homes, action: :index
    end
  end

end
