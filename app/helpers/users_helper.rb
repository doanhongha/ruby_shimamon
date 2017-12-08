module UsersHelper
  require 'aws-sdk-ses'
  def send_mail email, content
    Aws.config.update({credentials: Aws::Credentials.new('AKIAJGUTRBFKHWCUQ7WA', 'qmjM0a4/X4sWOi9kyIjUv7PpqLuqlz/VUABKdwxp')})
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
