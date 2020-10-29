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
  
  # ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  # has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  # has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  # has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  # has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================

  # def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
  #   passive_relationships.find_by(following_id: user.id).present?
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do |i|
    i.validates :nickname
    i.validates :email
    i.validates :password
    i.validates :encrypted_password
  end

  PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  def self.guset 
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = 'ゲスト用'
    end
  end
end