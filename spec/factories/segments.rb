# == Schema Information
#
# Table name: segments
#
#  id                        :integer          not null, primary key
#  default_sentence          :string
#  instruction               :text
#  novelty_goods             :string           default("none"), not null
#  official_site_instruction :text
#  segment_status            :string           default("ongoing"), not null
#  segment_title             :string           not null
#  segment_title_for_email   :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  program_id                :integer          not null
#
# Indexes
#
#  index_segments_on_program_id  (program_id)
#
# Foreign Keys
#
#  program_id  (program_id => programs.id)
#
FactoryBot.define do
  factory :segment do
    program
    segment_title { 'SegmentTitle' }
    segment_status { 'ongoing' }
    segment_title_for_email { 'SegmentTitleForEmail' }
    instruction { 'InstructionText' }
    official_site_instruction { 'OfficialSiteInstructionText' }
    default_sentence { 'DefaultSentence' }
    novelty_goods { 'none' }
  end
end
