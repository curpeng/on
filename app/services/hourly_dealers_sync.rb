# frozen_string_literal: true

class HourlyDealersSync
  def call
    to = Time.zone.now
    from = to - 1.hour

    connector = DealerConnector.new

    updated_dealer_ids = connector.updated(from: from, to: to)['ids']
    update_dealers(updated_dealer_ids)

    deleted_dealer_ids = connector.deleted(from: from, to: to)['deletedRecords']
    delete_dealers(deleted_dealer_ids)
  end

  private

  def update_dealers(ids)
    return if ids.empty?
    service = CreateOrUpdateDealer.new

    loader = BatchLoader.new(connector.find(ids))
    loader.find_each { |dealer_hash| service.call(dealer_hash) }
  end

  def delete_dealers(ids)
    return if ids.empty?
    Dealer.where(salesforce_id: ids).delete_all
  end
end
