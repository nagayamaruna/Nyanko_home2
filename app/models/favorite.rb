class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :nyankogram
  
  validates :user_id, uniqueness: {scope: :nyankogram_id}
end
