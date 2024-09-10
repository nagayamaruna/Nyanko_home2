class Tag < ApplicationRecord
  has_many :nyanko_tags, dependent: :destroy
    has_many :nyankos, through: :nyanko_tags
end
