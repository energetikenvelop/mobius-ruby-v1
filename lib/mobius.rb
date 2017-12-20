require './lib/requestor'
require './lib/resources/app_store'
require './lib/resources/tokens'

class Mobius

  attr_reader :app_store, :tokens

  def initialize(api_key:, host: nil, version: nil, auth: nil)
    requestor = Requestor.new(
      api_key: api_key, host: host, version: version, auth: auth
    )

    @app_store = AppStore.new(requestor)
    @tokens = Tokens.new(requestor)
  end

end
