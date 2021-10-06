# typed: strict
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@billbuck.app'
  layout 'mailer'
end
