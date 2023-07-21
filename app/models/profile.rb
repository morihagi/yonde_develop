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
class Profile < ApplicationRecord
  belongs_to :user

  validates :email_for_post, presence: true, allow_blank: true
  validates :prefecture, :city, :radio_name, :other_address, :legal_name, allow_blank: true
  validates :zip1, length: { is: 3 }, numericality: { only_integer: true }, allow_blank: true
  validates :zip2, length: { is: 4 }, numericality: { only_integer: true }, allow_blank: true
  validates :user_id, presence: true
end
