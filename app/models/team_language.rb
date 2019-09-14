class TeamLanguage < ApplicationRecord
  belongs_to :team

  validates :user_id, presence: true
  validates :name,    presence: true, length: { maximum: 50 }
end
