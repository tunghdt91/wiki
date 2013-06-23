class User < ActiveRecord::Base
  attr_accessible :birth_day, :date, :email, :group, :avatar_path, :address, :sothich, :caunoiuathich, :level, :name,:password, :password_confirmation
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true,
  									uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@framgia.com+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  default_scope order: 'users.created_at DESC'

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
