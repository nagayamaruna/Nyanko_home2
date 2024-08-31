class Notification < ApplicationRecord
  
  belongs_to :user
  belongs_to :message
  belongs_to :room

  validates :user_id, presence: true
  validates :message_id, presence: true
  validates :read, inclusion: { in: [true, false] }

end
