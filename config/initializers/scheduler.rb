require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

return if defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'

s.every '1h' do
  HourlyDealersSyncJob.perform_later
end
