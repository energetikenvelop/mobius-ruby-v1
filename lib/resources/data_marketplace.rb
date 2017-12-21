require './lib/abstract/resource'

class DataMarketplace < Resource
  def initialize(requestor)
    super(requestor, 'data_marketplace')
  end

  def data_feed(data_feed_uid:)
    get('data_feed', data_feed_uid: data_feed_uid)
  end

  def create_data_point(data_feed_uid:, values:)
    post_json('data_feed', data_feed_uid: data_feed_uid, values: values)
  end

  def buy(data_feed_uid:, address:)
    post('buy', data_feed_uid: data_feed_uid, address: address)
  end
end
