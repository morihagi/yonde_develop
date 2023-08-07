class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('OFFICIAL_E_MAIL')
  layout 'mailer'
end
