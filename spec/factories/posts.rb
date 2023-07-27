# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  body               :string
#  city               :string
#  email_for_post     :string
#  favorite_status    :string           default("unlike"), not null
#  legal_name         :string
#  other_addess       :string
#  post_status        :string           default("draft"), not null
#  prefecture         :string
#  radio_name         :string
#  zip1               :integer
#  zip2               :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  program_segment_id :integer          not null
#  user_id            :integer          not null
#
# Indexes
#
#  index_posts_on_program_segment_id  (program_segment_id)
#  index_posts_on_user_id             (user_id)
#
# Foreign Keys
#
#  program_segment_id  (program_segment_id => program_segments.id)
#  user_id             (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    email_for_post { "MyString" }
    prefecture { "MyString" }
    city { "MyString" }
    radio_name { "MyString" }
    zip1 { 1 }
    zip2 { 1 }
    other_addess { "MyString" }
    legal_name { "MyString" }
    favorite_status { "MyString" }
    post_status { "MyString" }
    body { "MyString" }
    user { nil }
    program_segment { nil }
  end
end
