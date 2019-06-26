class HourlyDealersSyncJob < ApplicationJob
  queue_as :syncs

  def perform
    HourlyDealersSync.new.call
  end
end
