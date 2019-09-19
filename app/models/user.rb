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

  validates :provider, uniqueness: { scope: :uid }, allow_nil: true

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter]

  def self.find_for_oauth(auth)
    def self.find_or_create_from_auth(auth)
      provider = auth[:provider]
      uid = auth[:uid]

      self.find_or_create_by(provider: provider, uid: uid) do |user|
        user.name      = auth[:info][:user_name]
        user.image_url = auth[:info][:image]
        user.email     = User.dummy_email(auth)
        user.password  = Devise.friendly_token[0, 20]
      end
    end
  end

  private

  # ダミーのアドレスを用意
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
