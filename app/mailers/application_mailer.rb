class ApplicationMailer < ActionMailer::Base
  default from: "Observant Alert <#{ENV['SMTP_USER']}>"
  default to: ENV['SMTP_USER']
  layout 'mailer'
end
