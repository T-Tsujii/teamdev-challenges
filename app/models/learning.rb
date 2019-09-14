class Learning < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :type,    presence: true, length: { maximum: 50 }
  validates :name,    presence: true, length: { maximum: 100 }
end
