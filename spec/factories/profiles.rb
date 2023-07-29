# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  city           :string
#  email_for_post :string
#  legal_name     :string
#  other_address  :string
#  phone          :string
#  prefecture     :string
#  radio_name     :string
#  zip1           :integer
#  zip2           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
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
    email { "MyString" }
    prefecture { "MyString" }
    city { "MyString" }
    radio_name { "MyString" }
    zip1 { "MyString" }
    integer { "MyString" }
    zip2 { "MyString" }
    integer { "MyString" }
    other_address { "MyString" }
    legal_name { "MyString" }
  end
end
