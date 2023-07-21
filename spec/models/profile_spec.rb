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
require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
