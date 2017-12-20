class Resource

  def initialize(requestor, resource)
    @requestor = requestor
    @resource = resource
  end

  def get(action, payload)
    @requestor.get(@resource, action, payload)
  end

  def post(action, payload)
    @requestor.post(@resource, action, payload)
  end
  
end
