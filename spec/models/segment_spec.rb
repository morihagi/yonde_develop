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
require 'rails_helper'

RSpec.describe Segment, type: :model do
  it { is_expected.to respond_to(:default_sentence) }
  it { is_expected.to respond_to(:instruction) }
  it { is_expected.to respond_to(:novelty_goods) }
  it { is_expected.to respond_to(:official_site_instruction) }
  it { is_expected.to respond_to(:segment_status) }
  it { is_expected.to respond_to(:segment_title) }
  it { is_expected.to respond_to(:segment_title_for_email) }
  it { is_expected.to respond_to(:program_id) }

  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to belong_to(:program) }

  it { is_expected.to validate_presence_of(:segment_title) }
  it { is_expected.to validate_presence_of(:segment_status) }
  it { is_expected.to validate_presence_of(:segment_title_for_email) }

  it { is_expected.to enumerize(:segment_status).in(:ongoing, :finished).with_default(:ongoing) }

  describe '.ransackable_associations' do
    it 'returns the list of ransackable associations' do
      expect(Segment.ransackable_associations).to eq(%w[posts program])
    end
  end

  describe '.ransackable_attributes' do
    it 'returns the list of ransackable attributes' do
      expect(Segment.ransackable_attributes).to eq(%w[id segment_title segment_status])
    end
  end
end
