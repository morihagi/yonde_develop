# == Schema Information
#
# Table name: program_segments
#
#  id                        :integer          not null, primary key
#  day                       :string           not null
#  default_sentence          :string
#  email                     :string           not null
#  image_url                 :string           not null
#  instruction               :text
#  novelty_goods             :string           default("none"), not null
#  official_site             :string           not null
#  official_site_instruction :text
#  personality               :string           not null
#  program                   :string           not null
#  program_status            :string           default("ongoing"), not null
#  segment                   :string           not null
#  segment_for_email         :string           not null
#  segment_status            :string           default("ongoing"), not null
#  starting_time             :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class ProgramSegment < ApplicationRecord
  extend Enumerize

  has_many :posts

  validates :email, :program, :segment, presence: true

  enumerize :program_status, in: %i[ ongoing finished ], default: :ongoing, scope: true
  enumerize :segment_status, in: %i[ ongoing finished ], default: :ongoing, scope: true
  enumerize :day, in: %i[ mon tue wed thu fri sat sun ], scope: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "program", "program_status", "segment", "segment_status", "updated_at"]
  end
end
