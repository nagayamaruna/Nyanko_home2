class Nyankogram < ApplicationRecord
  has_one_attached :nyankogram_image
  belongs_to :user

  validates :nyankogram_image, presence: true
  validates :post_body, presence: true
  
  has_many :nyankogram_post_comments, dependent: :destroy



  def get_post_image(width, height)
  unless nyankogram_image.attached?
    file_path = Rails.root.join('app/assets/images/profile_image.jpg')
    nyankogram_image.attach(io: File.open(file_path), filename: 'profile_image.jpg', content_type: 'image/jpeg')
  end
    nyankogram_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @nyankogram = Nyankogram.where("post_body LIKE?","#{word}")
    elsif search == "forward_match"
      @nyankogram = Nyankogram.where("post_body LIKE?","#{word}%")
    elsif search == "backward_match"
      @nyankogram = Nyankogram.where("post_body LIKE?","%#{word}")
    elsif search == "partial_match"
      @nyankogram = Nyankogram.where("post_body LIKE?","%#{word}%")
    else
      @nyankogram = Nyankogram.all
    end
  end

end
