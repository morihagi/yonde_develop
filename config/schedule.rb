require 'net/http'
require 'uri'

every 1.minute do
  command "curl https://yonde.fly.dev"
end
