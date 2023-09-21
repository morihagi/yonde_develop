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
FactoryBot.define do
  factory :program do
    program { "ProgramName" }
    personality { "PersonalityName" }
    email { "program@example.com" }
    image_url { "https://www.allnightnippon.com/wp/assets/uploads/2022/03/X-750_220316.jpg" }
    official_site { "https://www.allnightnippon.com/yy/" }
    day { "mon" }
    starting_time { "10:00" }
  end
end
