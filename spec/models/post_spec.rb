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
#  other_addess    :string
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
require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
