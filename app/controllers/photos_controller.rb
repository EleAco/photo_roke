class PhotosController < ApplicationController
  before_action :move_to_index
  
  def index
  end

  def new
    # @photo = Photo.new
    @page_name ='投稿ページ'
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to controller: :homes, action: :index
    end
  end

end
