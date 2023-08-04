class ApplicationMailer < ActionMailer::Base
  default from: ENV['OFFICIAL_E_MAIL']
  layout 'mailer'
end
