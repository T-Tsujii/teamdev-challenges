class MySite < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name,    presence: true, length: { maximum: 20 }
  validates :url,     presence: true,
                      length: { maximum: 200 },
                      format: { with: %r{\Ahttp[s]?:\/\/[\w-]+\.[\w-]+},
                                message: "URLが正しくありません。" }
end