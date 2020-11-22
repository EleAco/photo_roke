class User < ApplicationRecord
  has_many :photos
  has_many :comments
  has_many :favorites
  has_many :favorite_photos, through: :favorites, source: :photo
  has_one_attached :avatar

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  with_options presence: true do |i|
    i.validates :nickname
    i.validates :email
    i.validates :encrypted_password
  end

  validates :nickname, length: { maximum: 7 }
  validates :profile, length: { maximum: 200 }

  PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # validates_format_of :password, with: PASSWORD_REGEX
  validates :password, format: {with: PASSWORD_REGEX}, allow_blank: true
  validates :password, presence: true, on: :create
  

  #フォローしているかを確認するメソッド
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  #フォローするときのメソッド
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  #フォローを外すときのメソッド
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end



  def self.guset 
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = 'ゲスト用'
    end
  end
end