class NyankogramPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :nyankogram
  
  validates :comment, length: { in: 1..140 }
end
