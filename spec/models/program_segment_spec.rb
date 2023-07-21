# == Schema Information
#
# Table name: program_segments
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  program    :string           not null
#  segment    :string           not null
#  status     :string           default("ongoing"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ProgramSegment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
