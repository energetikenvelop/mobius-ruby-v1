require './lib/abstract/resource'

class Tokens < Resource

  def initialize(requestor)
    super(requestor, 'tokens')
  end

  def register(token_type:, name:, symbol:, issuer:)
    post('register', token_type: token_type, name: name, symbol: symbol, issuer: issuer)
  end

  def create_address(token_uid:)
    post('create_address', token_uid: token_uid)
  end

  def register_address(token_uid:, address:)
    post('register_address', token_uid: token_uid, address: address)
  end

  def balance(token_uid:, address:)
    get('balance', token_uid: token_uid, address: address)
  end

  def transfer_managed(token_address_uid:, address_to:, num_tokens:)
    post('transfer/managed', token_address_uid: token_address_uid, address_to: address_to, num_tokens: num_tokens)
  end

  def transfer_info(token_address_transfer_uid:)
    get('transfer/info', token_address_transfer_uid: token_address_transfer_uid)
  end

end
