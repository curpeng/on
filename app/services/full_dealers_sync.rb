# frozen_string_literal: true

class FullDealersSync
  def call
    connector = DealerConnector.new
    loader = BatchLoader.new(connector.all)
    service = CreateOrUpdateDealer.new

    loader.find_each do |dealer_hash|
      service.call(dealer_hash)
    end
  end
end
