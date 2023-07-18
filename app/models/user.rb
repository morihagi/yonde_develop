class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  before_save { self.email = email.downcase }
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true, 
                    length: { minimum: 8 }, 
                    format: { with: VALID_PASSWORD_REGEX }, 
                    allow_nil: true

  validates_acceptance_of :agreement, allow_nil: false, on: :create

  def remember_me
    true
  end
end
