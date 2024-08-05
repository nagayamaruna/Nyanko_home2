class Nyanko < ApplicationRecord
  has_one_attached :image
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

  def self.looks(search, word)
    if search == "perfect_match"
      @naynko = Nyanko.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @naynko = Nyanko.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @naynko = Nyanko.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @naynko = Nyanko.where("title LIKE?","%#{word}%")
    else
      @naynko = Nyanko.all
    end
  end  
end
