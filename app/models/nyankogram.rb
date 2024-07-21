class Nyankogram < ApplicationRecord
  has_one_attached :post_image
  belongs_to :user

  validates :post_image, presence: true
  validates :post_body, presence: true

  # def get_post_image(width, height)
  # unless post_image.attached?
  #   file_path = Rails.root.join('app/assets/images/profile_image.jpg')
  #   post_image.attach(io: File.open(file_path), filename: 'profile_image.jpg', content_type: 'image/jpeg')
  # end
  #   post_image.variant(resize_to_limit: [width, height]).processed
  # end

end
