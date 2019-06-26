# frozen_string_literal: true

class CreateOrUpdateDealer
  def call(dealer_attrs)
    parsed_attrs = parse(dealer_attrs)
    dealer = Dealer.find_or_initialize_by(salesforce_id: parsed_attrs['Id'])

    return unless parsed_attrs[:latitude] && parsed_attrs[:longitude] && parsed_attrs[:name]
    dealer.update!(parsed_attrs)
  end

  private

  def parse(attrs)
    {
      salesforce_id: attrs['Id'],
      name: attrs['Name'],
      street: attrs['POS_Street__c'],
      city: attrs['POS_Street__c'],
      zip: attrs['POS_ZIP__c'],
      country: attrs['POS_Country__c'],
      state: attrs['POS_State__c'],
      phone: attrs['POS_Phone__c'],
      latitude: attrs['Dealer_Latitude__c'],
      longitude: attrs['Dealer_Longitude__c'],
    }
  end
end
