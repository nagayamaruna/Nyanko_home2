class NyankoHashtag < ApplicationRecord
  belongs_to :hashtag_id
  has_many :hashtags, dependent: :destroy
  has_many :nyankos, dependent: :destroy
end
