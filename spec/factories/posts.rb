# == Schema Information
#
# Table name: posts
#
#  id                   :integer          not null, primary key
#  body                 :text
#  city                 :string
#  favorite_status      :string           default("unlike"), not null
#  legal_name           :string
#  other_address        :string
#  phone                :string
#  post_status          :string           default("draft"), not null
#  prefecture           :string
#  radio_name           :string
#  residence_city       :string
#  residence_prefecture :string
#  zip_code             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  segment_id           :integer          not null
#  user_id              :integer          not null
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
    body { "MyText" }
    city { "MyCity" }
    legal_name { "MyLegalName" }
    other_address { "MyOtherAddress" }
    phone { "MyPhone" }
    prefecture { "MyPrefecture" }
    radio_name { "MyRadioName" }
    residence_city { "MyResidenceCity" }
    residence_prefecture { "MyResidencePrefecture" }
    zip_code { "1234567" }
    association :user
    association :segment
  end
end
