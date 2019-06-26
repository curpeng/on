# frozen_string_literal: true
require 'restforce'

class SalesforceApiClient
  delegate_missing_to :@client

  attr_reader :client
  def initialize(config = Rails.configuration.x.salesforce)
    @client = Restforce.new(
      host: config['host'],
      username: config['username'],
      password: config['password'],
      security_token: config['security_token'],
      client_id: config['client_id'],
      client_secret: config['client_secret'],
      api_version: '41.0'
    )

    @client.authenticate!
  end
end
