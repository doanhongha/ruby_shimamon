class MailerJob

  require_relative '../helpers/users_helper'
  require 'sidekiq-scheduler'
  include Sidekiq::Worker
  include UsersHelper
  def perform
    tasks = Task.where(['deadline < ?', Time.now + 2.days]).where.not(status: 3)
    tasks.each do |task|
      email = 'doanhong.ha@monstar-lab.com'
      content = "Task #{task.name} is about to expire!"
      send_mail email, content
    end
  end
end