class User < ApplicationRecord
  has_many :my_sites,            dependent: :destroy
  has_many :preferred_languages, dependent: :destroy
  has_many :languages,           dependent: :destroy
  has_many :learnings,           dependent: :destroy
  has_many :teams
  has_many :team_participants,   dependent: :destroy
  has_many :posts

  validates :name,    length: { maximum: 40 }
  validates :content, length: { maximum: 2000 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
