# == Schema Information
#
# Table name: program_segments
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  program    :string           not null
#  segment    :string           not null
#  status     :string           default("ongoing"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :program_segment do
    program { "MyString" }
    email { "MyString" }
    segment { "MyString" }
    status { "MyString" }
  end
end
