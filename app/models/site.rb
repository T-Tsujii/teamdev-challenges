class Site < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name,    presence: true, length: { maximum: 30 }
  validates :url,     length: { maximum: 300 },
                      format: { with: %r{\Ahttp[s]?:\/\/[\w-]+\.[\w-]+},
                                message: "を正しく入力して下さい。" }
end