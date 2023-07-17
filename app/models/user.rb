class User < ApplicationRecord

  before_save { self.email = email.downcase }
  validates :email, presence: true, 
                    format: { with: URI::MailTo::EMAIL_REGEXP }, 
                    uniqueness: { case_sensitive: false }

  has_secure_password
  VALID_PASSWORD_REGEX = /\A[\w\-]{8,}\z/
  validates :password, presence: true,
                    length: { minimum: 8 },
                    format: { with: VALID_PASSWORD_REGEX },
                    allow_nil: true

  validates_acceptance_of :agreement, allow_nil: false, on: :create
end