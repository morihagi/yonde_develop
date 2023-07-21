# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  email_for_post :string
#  prefecture     :string
#  city           :string
#  radio_name     :string
#  zip1           :integer
#  zip2           :integer
#  other_address   :string
#  legal_name     :string
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
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
