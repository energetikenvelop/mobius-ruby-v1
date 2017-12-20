require './lib/abstract/resource'

class AppStore < Resource

  def initialize(requestor)
    super(requestor, 'app_store')
  end

  def balance(app_uid:, email:)
    get('balance', app_uid: app_uid, email: email)
  end

  def use(app_uid:, email:, num_credits:)
    post('use', app_uid: app_uid, email: email, num_credits: num_credits)
  end

end
