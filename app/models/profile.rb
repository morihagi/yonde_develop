# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  city           :string
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
class Profile < ApplicationRecord
  belongs_to :user

  validates :prefecture, :city, :radio_name, :other_address, :legal_name, allow_blank: true
  validates :zip_code, presence: true, allow_blank: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :user_id, presence: true
end
