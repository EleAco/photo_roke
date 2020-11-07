class PhotosController < ApplicationController
  before_action :move_to_index
  
  def index
    @photo = Photo.all.order('created_at DESC')
    @page_name ='みんなの投稿'
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
    @page_name = @photo.title
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to root_path
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])
    photo.update(photo_params)
  end

  def search
    @photos = Photo.search(params[:keyword])
    
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :explanation, :title, :latitude, :longitude).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to controller: :homes, action: :index
    end
  end

end
