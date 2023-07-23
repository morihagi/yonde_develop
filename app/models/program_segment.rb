# == Schema Information
#
# Table name: program_segments
#
#  id             :integer          not null, primary key
#  email          :string           not null
#  program        :string           not null
#  program_status :string           default("ongoing"), not null
#  segment        :string           not null
#  segment_status :string           default("ongoing"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class ProgramSegment < ApplicationRecord
  extend Enumerize

  validates :email, :program, :segment, presence: true

  enumerize :program_status, in: %i[ ongoing finished ], default: :ongoing, scope: true
  enumerize :segment_status, in: %i[ ongoing finished ], default: :ongoing, scope: true
end
