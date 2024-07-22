class Nyankogram < ApplicationRecord
  has_one_attached :post_images
  belongs_to :user

  validates :post_images, presence: true
  validates :post_body, presence: true
  
  

  def get_post_image(width, height)
  unless post_images.attached?
    file_path = Rails.root.join('app/assets/images/profile_image.jpg')
    post_images.attach(io: File.open(file_path), filename: 'profile_image.jpg', content_type: 'image/jpeg')
  end
    post_images.variant(resize_to_limit: [width, height]).processed
  end

end
