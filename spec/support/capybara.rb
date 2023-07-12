RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selnium, using: :headless_chrome, screen_size: [1920, 1080]
  end
end
