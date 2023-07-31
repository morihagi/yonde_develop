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
class Program < ApplicationRecord
  has_many :segments

  validates :program, :personality, :email, :image_url, :official_site, :day, :starting_time, presence: true

  extend Enumerize
  enumerize :program_status, in: %i[ ongoing finished ], default: :ongoing, scope: true
  enumerize :segment_status, in: %i[ ongoing finished ], default: :ongoing, scope: true
  enumerize :day, in: %i[ mon tue wed thu fri sat sun ], scope: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "program", "program_status", "segment_title", "segment_status", "updated_at"]
  end
end
