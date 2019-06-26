# frozen_string_literal: true

class DealerConnector
  ACCOUNT_FIELDS = [
    'Id',
    'Name',
    'POS_Street__c',
    'POS_City__c',
    'POS_ZIP__c',
    'POS_Country__c',
    'POS_State__c',
    'POS_Phone__c',
    'Dealer_Latitude__c',
    'Dealer_Longitude__c'
  ]

  ACCOUNT_TYPE = 'Dealer and Point of Sale'

  def initialize(client = SalesforceApiClient.new)
    @client = client
  end

  def all
    client.query(select_all_dealers_query)
  end

  def find(ids)
    client.query(select_dealers_by_id_query(ids))
  end

  def updated(from:, to:)
    client.get_updated('Account', from, to)
  end

  def deleted(from:, to:)
    client.get_deleted('Account', from, to)
  end

  private

  attr_reader :client

  def select_all_dealers_query
    "SELECT #{ACCOUNT_FIELDS.join(', ')} FROM Account WHERE Account.E_Shop_Dealer__c = '#{ACCOUNT_TYPE}'"
  end

  def select_dealers_by_id_query(ids)
    "SELECT #{ACCOUNT_FIELDS.join(', ')} FROM Account WHERE Account.Id IN ('#{ids.join(',')}')"
  end
end
