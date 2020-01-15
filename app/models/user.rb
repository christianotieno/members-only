class User < ApplicationRecord
  before_create :remember
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_token).is_password?(remember_token)
  end

  def remember
    self.remember_digest = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end
  has_many :posts
end
