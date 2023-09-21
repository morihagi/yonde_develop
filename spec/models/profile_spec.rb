# == Schema Information
#
# Table name: profiles
#
#  id                   :integer          not null, primary key
#  city                 :string
#  legal_name           :string
#  other_address        :string
#  phone                :string
#  prefecture           :string
#  radio_name           :string
#  residence_city       :string
#  residence_prefecture :string
#  zip_code             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { is_expected.to respond_to(:city) }
  it { is_expected.to respond_to(:legal_name) }
  it { is_expected.to respond_to(:other_address) }
  it { is_expected.to respond_to(:phone) }
  it { is_expected.to respond_to(:prefecture) }
  it { is_expected.to respond_to(:radio_name) }
  it { is_expected.to respond_to(:residence_city) }
  it { is_expected.to respond_to(:residence_prefecture) }
  it { is_expected.to respond_to(:zip_code) }
  it { is_expected.to respond_to(:user_id) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to allow_value(nil, '', '1234567').for(:zip_code) }
  it { is_expected.to validate_length_of(:zip_code).is_equal_to(7).allow_nil }
  it { is_expected.to validate_numericality_of(:zip_code).only_integer.allow_nil }
end
