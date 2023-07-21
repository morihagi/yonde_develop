# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string
#  uid                    :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :trackable, :lockable,
          :omniauthable, omniauth_providers: %i[ google_oauth2 ]

  has_one :profile, dependent: :destroy

  validates :name, presence: true

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true,
                    length: { minimum: 8 },
                    format: { with: VALID_PASSWORD_REGEX },
                    allow_nil: true,
                    unless: :google_registration?

  validates_acceptance_of :agreement, allow_nil: false, on: :create, unless: :google_registration?
  validates :uid, presence: true, uniqueness: { scope: :provider }, if: -> { uid.present? }

  def remember_me
    true
  end

  protected

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(name: data['name'],
              email: data['email'],
              password: Devise.friendly_token[0,20],
              agreement: true
          )
      end
      user
    end

  def google_registration?
    provider == 'google_oauth2'
  end
end
