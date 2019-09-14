class Team < ApplicationRecord
  belongs_to :user
  has_many :team_languages,    dependent: :destroy
  has_many :team_participants, dependent: :destroy
  has_many :posts,             dependent: :destroy

  validates :user_id,     presence: true
  validates :name,        presence: true, uniqueness: true
  validates :recruitment, presence: true
end