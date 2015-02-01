require 'json'
require 'net/http'
require 'openssl'
require 'time'

def test_api (app_id)
  @app_id = app_id
  uri = URI.parse('https://api.branch.com/v1/app')
  req = Net::HTTP::Get.new(uri)

  body      = ''

  message   = uri.to_s + body.to_s
  
  req.add_field("Content-Type", "application/json")
  req.add_field("app_id", app_id)

  res = Net::HTTP.start(uri.host, uri.port).request(req)
  # use_ssl: (uri.scheme == 'https')
  res = JSON.parse(res.body)
  p res
end

