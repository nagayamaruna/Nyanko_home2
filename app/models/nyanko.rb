class Nyanko < ApplicationRecord
  has_one_attached :image
  has_many :nyanko_hashtags, dependent: :destroy
  has_many :hashtags, through: :nyanko_hashtags
  belongs_to :user

  validates :image, presence: true
  validates :body, presence: true
  
  after_create_commit :update_hashtags
  before_update :update_hashtags


  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/profile_image.jpg')
    image.attach(io: File.open(file_path), filename: 'profile_image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end
end


 private
 
   def update_hashtags
    hashtags = hashname.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      self.hashtags << tag
    end
   end
