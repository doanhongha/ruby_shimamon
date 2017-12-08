class CustomMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.custom_mailer.test.subject
  #
  default from: 'doxuan.thanh@monstar-lab.com'

  def test
    @greeting = "Hi"

    mail to: "doanhong.ha@monstar-lab.com"
  end
end
