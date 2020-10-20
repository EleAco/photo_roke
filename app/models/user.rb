class User < ApplicationRecord
  has_many :photos
  has_many :comments

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