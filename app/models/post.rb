class Post < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :team_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
end