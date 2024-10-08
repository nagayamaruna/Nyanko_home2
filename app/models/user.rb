class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_length_of :introduction, maximum: 200

  has_many :nyankos, dependent: :destroy
  has_many :nyankogram_post_comments, dependent: :destroy
  has_many :nyankograms, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_one_attached :profile_image

  def get_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'profile_image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end

end
