# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :token
  before_create :remember
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.new_token
    token = SecureRandom.urlsafe_base64
    Digest::SHA1.hexdigest(token.to_s)
  end

  def change_token
    self.token = User.new_token
    update_attribute(:remember_token, token)
  end

  private

  def remember
    self.remember_token = User.new_token
  end
end
