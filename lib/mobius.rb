require './lib/requestor'
require './lib/resources/app_store'
require './lib/resources/tokens'
require './lib/resources/data_marketplace'

class Mobius
  attr_reader :app_store, :tokens, :data_marketplace

  def initialize(api_key:, host: nil, version: nil, auth: nil)
    requestor = Requestor.new(
      api_key: api_key, host: host, version: version, auth: auth
    )

    @app_store = AppStore.new(requestor)
    @tokens = Tokens.new(requestor)
    @data_marketplace = DataMarketplace.new(requestor)
  end
end
