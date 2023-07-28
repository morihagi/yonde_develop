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
require 'rails_helper'

RSpec.describe ProgramSegment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
