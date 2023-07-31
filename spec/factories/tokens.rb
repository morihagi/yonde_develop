FactoryBot.define do
  factory :token do
    oauth_token { "MyString" }
    oauth_expires_at { "2023-07-31 13:27:04" }
    access_token { "MyString" }
    refresh_token { "MyString" }
    expires_at { "2023-07-31 13:27:04" }
  end
end
