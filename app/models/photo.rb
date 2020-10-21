class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  def self.search(search)
    if search != ""
      Photo.where('text LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end
end