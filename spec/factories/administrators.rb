# == Schema Information
#
# Table name: administrators
#
#  id                        :integer          not null, primary key
#  email                     :string
#  first_name                :string
#  last_name                 :string
#  password_digest           :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
FactoryBot.define do
  factory :administrator do
    email { "admin@example.com" }
    password_digest { BCrypt::Password.create('password') }
    first_name { "Admin" }
    last_name { "User" }
    remember_token { SecureRandom.urlsafe_base64 }
    remember_token_expires_at { 1.year.from_now }
  end
end
