# == Schema Information
#
# Table name: posts
#
#  id                   :integer          not null, primary key
#  body                 :text
#  city                 :string
#  favorite_status      :string           default("unlike"), not null
#  legal_name           :string
#  other_address        :string
#  phone                :string
#  post_status          :string           default("draft"), not null
#  prefecture           :string
#  radio_name           :string
#  residence_city       :string
#  residence_prefecture :string
#  zip_code             :string
#  buildd_at           :datetime         not null
#  updated_at           :datetime         not null
#  segment_id           :integer          not null
#  user_id              :integer          not null
#
# Indexes
#
#  index_posts_on_segment_id  (segment_id)
#  index_posts_on_user_id     (user_id)
#
# Foreign Keys
#
#  segment_id  (segment_id => segments.id)
#  user_id     (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:segment) }

  it { is_expected.to allow_value(nil, '', '1234567').for(:zip_code) }
  it { is_expected.to validate_length_of(:zip_code).is_equal_to(7).allow_nil }
  it { is_expected.to validate_numericality_of(:zip_code).only_integer.allow_nil }

  it { is_expected.to enumerize(:favorite_status).in(:unlike, :like).with_default(:unlike) }
  it { is_expected.to enumerize(:post_status).in(:draft, :sent).with_default(:draft) }
  
  describe '.ransackable_attributes' do
    it 'returns the list of ransackable attributes' do
      expect(Post.ransackable_attributes).to eq(%w[id segment_title residence_prefecture residence_city radio_name body zip_code prefecture city other_address phone legal_name segment_id user_id post_status favorite_status created_at updated_at]
      )
    end
  end
  describe '.ransackable_associations' do
    it 'returns the list of ransackable associations' do
      expect(Post.ransackable_associations).to eq(%w[segment user])
    end
  end
end
