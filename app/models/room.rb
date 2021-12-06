class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :room_image

  default_scope -> {order(create_at: :desc) }

  validates :user_id, presence: true, allow_nil: true
  validates :name, presence: true, length: {maximum: 50 }
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :room_image, content_type: {in: %w[image/jpeg image/gif image/png],
                    message: "有効な画像形式である必要があります" }

  def self.search(search)
    if search
      Room.where(['address LIKE ? OR introduction LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end
end
