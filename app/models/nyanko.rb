class Nyanko < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user
  
  validates :image, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
