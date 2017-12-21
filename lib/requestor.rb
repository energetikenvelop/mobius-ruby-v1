require 'http'

class ApiError < StandardError
end

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

  def post_json(resource, action, payload)
    request('POST_JSON', resource, action, payload)
  end

  private

  def request(method, resource, action, payload)
    url = "#{@host}/#{@version}/#{resource}/#{action}"

    headers = { 'x-api-key': @api_key }

    if @auth
      headers['Authorization'] = @auth
    end

    http = HTTP.headers(headers)

    response =
      case method
      when 'GET'
        http.get(url, params: payload)
      when 'POST'
        http.post(url, form: payload)
      when 'POST_JSON'
        http.post(url, json: payload)
      end

    if response.code >= 400
      message = ''

      begin
        error = response.parse
        message = error['error']['message']
      rescue StandardError
        message = 'Something wrong'
      end

      raise ApiError.new, message
    end

    response.parse
  end
end
