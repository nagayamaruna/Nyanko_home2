class Nyanko < ApplicationRecord
  has_one_attached :image
  
  has_many :nyanko_tags, dependent: :destroy
  has_many :tags, through: :nyanko_tags
  
  belongs_to :user

  validates :image, presence: true
  validates :body, presence: true


  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/profile_image.jpg')
    image.attach(io: File.open(file_path), filename: 'profile_image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
