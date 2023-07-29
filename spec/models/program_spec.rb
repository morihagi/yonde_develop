# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  day            :string           not null
#  email          :string           not null
#  image_url      :string           not null
#  official_site  :string           not null
#  personality    :string           not null
#  program        :string           not null
#  program_status :string           default("ongoing"), not null
#  starting_time  :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Program, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
