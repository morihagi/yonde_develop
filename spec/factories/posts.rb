# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  body            :text
#  city            :string
#  email_for_post  :string
#  favorite_status :string           default("unlike"), not null
#  legal_name      :string
#  other_address    :string
#  post_status     :string           default("draft"), not null
#  prefecture      :string
#  radio_name      :string
#  zip1            :integer
#  zip2            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  segment_id      :integer
#  user_id         :integer          not null
#
# Indexes
#
#  index_posts_on_segment_id  (segment_id)
#  index_posts_on_user_id     (user_id)
#
# Foreign Keys
#
#  segment_id  (segment_id => segments.id)
#  user_id     (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    email_for_post { "MyString" }
    prefecture { "MyString" }
    city { "MyString" }
    radio_name { "MyString" }
    zip1 { 1 }
    zip2 { 1 }
    other_address { "MyString" }
    legal_name { "MyString" }
    favorite_status { "MyString" }
    post_status { "MyString" }
    body { "MyString" }
    user { nil }
    segment { 1 }
  end
end
