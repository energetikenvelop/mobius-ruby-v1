require 'http'

class Requestor

  def initialize(api_key:, host: nil, version: nil, auth: nil)
    @api_key = api_key
    @host = host || 'https://mobius.network/api'
    @version = version || 'v1'
    @auth = auth
  end

  def get(resource, action, payload)
    request('GET', resource, action, payload)
  end

  def post(resource, action, payload)
    request('POST', resource, action, payload)
  end

  private

  def request(method, resource, action, payload)
    url = "#{ @host }/#{ @version }/#{ resource }/#{ action }"

    headers = {'x-api-key': @api_key}

    if @auth
      headers['Authorization'] = @auth
    end

    http = HTTP.headers(headers)

    response = case method
      when 'GET'
        http.get(url, params: payload)
      when 'POST'
        http.post(url, form: payload)
    end

    if response.code >= 400
    end

    response.parse
  end

end
