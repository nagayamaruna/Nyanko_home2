class Hashtag < ApplicationRecord
  has_many :nyanko_hashtags, dependent: :destroy
  has_many :nyankos, through: :nyanko_hashtags
end
