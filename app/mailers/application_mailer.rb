class ApplicationMailer < ActionMailer::Base
  default from: "YONDE <#{ENV['OFFICIAL_E_MAIL']}>"
  layout 'mailer'
end
