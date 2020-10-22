class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Photo.where('text LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end
end