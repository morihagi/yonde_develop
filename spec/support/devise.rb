RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers
  # config.include Devise::Test::IntegrationHelpers, type: :request
  # config.include Devise::Test::ControllerHelpers, type: :controller
  # config.include Devise::Test::ControllerHelpers, type: :view
  # config.include Devise::Test::ControllerHelpers, type: :system
end
