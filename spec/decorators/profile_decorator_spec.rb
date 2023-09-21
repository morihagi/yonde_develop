require 'rails_helper'

RSpec.describe ProfileDecorator, type: :decorator do
  let(:profile) { Profile.new(prefecture: 'Tokyo', city: 'Shinjuku', other_address: '1-2-3', residence_prefecture: 'Osaka', residence_city: 'Namba') }

  let(:decorator) { described_class.new(profile) }

  describe '#full_address_post' do
    it 'returns the full residence address' do
      expect(decorator.full_address_post).to eq('OsakaNamba')
    end
  end

  describe '#full_address' do
    it 'returns the full address' do
      expect(decorator.full_address).to eq('TokyoShinjuku1-2-3')
    end
  end
end
