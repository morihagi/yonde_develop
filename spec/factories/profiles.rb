# == Schema Information
#
# Table name: profiles
#
#  id                   :integer          not null, primary key
#  city                 :string
#  legal_name           :string
#  other_address        :string
#  phone                :string
#  prefecture           :string
#  radio_name           :string
#  residence_city       :string
#  residence_prefecture :string
#  zip_code             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :profile do
    user
    prefecture { "Tokyo" }
    city { "Chiyoda" }
    radio_name { "RadioName" }
    zip_code { "1234567" }
    other_address { "OtherAddress" }
    legal_name { "LegalName" }
    phone { "090-0000-0000" }
    residence_prefecture { "Kanagawa" }
    residence_city { "Yokohama" }
  end
end
