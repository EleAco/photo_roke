class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :favorites

  with_options presence: true do |i|
    i.validates :title
    i.validates :image
  end

  validates :title, length: {maximum:20}


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Photo.where('title LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end
end