# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  city           :string
#  email_for_post :string
#  legal_name     :string
#  other_address  :string
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
class Profile < ApplicationRecord
  belongs_to :user

  validates :email_for_post, presence: true, allow_blank: true
  validates :prefecture, :city, :radio_name, :other_address, :legal_name, allow_blank: true
  validates :zip1, length: { is: 3 }, numericality: { only_integer: true }, allow_blank: true
  validates :zip2, length: { is: 4 }, numericality: { only_integer: true }, allow_blank: true
  validates :user_id, presence: true
end
