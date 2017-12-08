module UsersHelper
  require 'aws-sdk-ses'
  def send_mail email, content
    Aws.config.update({credentials: Aws::Credentials.new(ENV["ACCESS_KEY_ID"], ENV["SECRET_ACCESS_KEY"])})
    ses = Aws::SES::Client.new(
        :region => 'us-east-1'
    )
    ses.send_email(
        {
            destination: {
                to_addresses: [email]
            },
            message: {
                body: {
                    text: {
                        charset: 'UTF-8',
                        data: content
                    }
                },
                subject: {
                    charset: 'UTF-8',
                    data: 'mail subject'
                }
            },
            source: 'doanhong.ha@monstar-lab.com'
        }
    )
  end
end
