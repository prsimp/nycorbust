class User < ActiveRecord::Base
  before_save :create_auth_token

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  email_regex = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  validates :password, presence: { on: :create },
                       length: { minimum: 8 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: email_regex }

  private

  def create_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end
end
