class FullDealersSyncJob < ApplicationJob
  queue_as :syncs

  def perform
    FullDealersSync.new.call
  end
end
