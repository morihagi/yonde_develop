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
  it { is_expected.to respond_to(:program) }
  it { is_expected.to respond_to(:personality) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:image_url) }
  it { is_expected.to respond_to(:official_site) }
  it { is_expected.to respond_to(:day) }
  it { is_expected.to respond_to(:starting_time) }

  it { is_expected.to have_many(:segments).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:program) }
  it { is_expected.to validate_presence_of(:personality) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:image_url) }
  it { is_expected.to validate_presence_of(:official_site) }
  it { is_expected.to validate_presence_of(:day) }
  it { is_expected.to validate_presence_of(:starting_time) }

  it { is_expected.to enumerize(:program_status).in(:ongoing, :finished).with_default(:ongoing) }

  describe '.ransackable_attributes' do
    it 'returns the list of ransackable attributes' do
      expect(Program.ransackable_attributes).to eq(%w[id email program program_status segment_title segment_status
                                                      created_at updated_at])
    end
  end
end
