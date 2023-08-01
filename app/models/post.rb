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
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :segment

  extend Enumerize
  enumerize :favorite_status, in: %i[ unlike like ], default: :unlike, scope: true
  enumerize :post_status, in: %i[ draft gmail_draft gmail_sent archived ], default: :draft, scope: true

  def self.ransackable_attributes(auth_object = nil)
    ["segment_title", "body", "city", "created_at", "email_for_post", "favorite_status", "id", "legal_name", "other_address", "post_status", "prefecture", "segment_id", "radio_name", "updated_at", "user_id", "zip_code"]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "segment", "user" ]
  end
end
