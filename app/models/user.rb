class User < ApplicationRecord
	has_many :rooms, dependent: :destroy
	has_one_attached :avatar


	before_save  { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
										length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	validates :avatar, content_type: {in: %w[image/jpeg image/gif image/png],
									  message: "有効な画像形式である必要があります"	},
						 size:  {less_than: 5.megabytes,
										message: "ファイルサイズが5MB未満のものを選んでください" }

end
