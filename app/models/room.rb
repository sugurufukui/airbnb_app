class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :room_image

  default_scope -> {order(create_at: :desc) }

  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 50 }
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, content_type: {in: %w[image/jpeg image/gif image/png],
                    message: "有効な画像形式である必要があります" }
end
