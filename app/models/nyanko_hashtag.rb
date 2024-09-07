class NyankoHashtag < ApplicationRecord
  belongs_to :hashtag
  belongs_to :nyanko
  
  validates :hashtag_id, presence: true
  validates :nyanko_id, presence: true
end
