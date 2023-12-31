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
class Segment < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :program

  validates :segment_title, :segment_status, :segment_title_for_email, presence: true

  extend Enumerize
  enumerize :segment_status, in: %i[ongoing finished], default: :ongoing, scope: true

  def self.ransackable_associations(_auth_object = nil)
    %w[posts program]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id segment_title segment_status]
  end
end
