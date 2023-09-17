# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  body            :text
#  city            :string
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

  validates :residence_prefecture, :residence_city, :radio_name, :prefecture, :city, :other_address, :phone, :legal_name ,allow_blank: true
  validates :zip_code, presence: true, allow_blank: true, length: { is: 7 }, numericality: { only_integer: true }

  extend Enumerize
  enumerize :favorite_status, in: %i[unlike like], default: :unlike, scope: true
  enumerize :post_status, in: %i[draft sent], default: :draft, scope: true

  
  def self.ransackable_attributes(_auth_object = nil)
    %w[id segment_title residence_prefecture residence_city radio_name body zip_code prefecture city other_address phone legal_name segment_id user_id post_status favorite_status created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[segment user]
  end
end
