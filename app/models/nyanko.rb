class Nyanko < ApplicationRecord
  has_one_attached :image
  has_many :nyanko_hashtags, dependent: :destroy
  has_many :hashtags, through: :nyanko_hashtags
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
end

   after_create do
    nyanko = Nyanko.find_by(id: id)
    # hashnameに打ち込まれたハッシュタグを検出
    hashtags = hashname.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      # ハッシュタグは先頭の#を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      nyanko.hashtags << tag
    end
  end
  #更新アクション
  before_update do
    nyanko = Nyanko.find_by(id: id)
    nyanko.hashtags.clear
    hashtags = hashname.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      nyanko.hashtags << tag
    end
  end
