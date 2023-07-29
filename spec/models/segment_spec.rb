# == Schema Information
#
# Table name: segments
#
#  id                        :integer          not null, primary key
#  default_sentence          :string           not null
#  instruction               :text
#  novelty_goods             :string           default("none"), not null
#  official_site_instruction :text
#  segment_status            :string           default("ongoing"), not null
#  segment_title             :string           not null
#  segment_title_for_email   :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  post_id                   :integer          not null
#  program_id                :integer          not null
#
# Indexes
#
#  index_segments_on_post_id     (post_id)
#  index_segments_on_program_id  (program_id)
#
# Foreign Keys
#
#  post_id     (post_id => posts.id)
#  program_id  (program_id => programs.id)
#
require 'rails_helper'

RSpec.describe Segment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
