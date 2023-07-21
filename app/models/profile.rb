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
#  other_addess   :string
#  legal_name     :string
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Profile < ApplicationRecord
  validates :email_for_post, allow_blank: true
  validates :prefecture, allow_blank: true
  validates :city, allow_blank: true
  validates :radio_name, allow_blank: true
  validates :zip1, length: { is: 3 }, :numericality => { :allow_blank => true }
  validates :zip2, length: { is: 4 }, :numericality => { :allow_blank => true }
  validates :other_addess, allow_blank: true
  validates :legal_name, allow_blank: true
end
