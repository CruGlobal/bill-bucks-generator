# typed: true
require 'net/http'

module OktaOauth
  API_HOST = ENV.fetch('OKTA_SERVER_URL').sub('https://', '')
  REDIRECT_URI = ENV.fetch('OKTA_OAUTH_CALLBACK_URL')

  AuthorizeParams = Struct.new(:redirect_url, :state)
  OktaToken = Struct.new(:id_token, :access_token, :expires_at)

  def self.authorize_params(prompt: nil)
    client_id = ENV['OKTA_OAUTH_CLIENT_ID']
    redirect_uri = CGI.escape(REDIRECT_URI)
    nonce = SecureRandom.base64(32)
    state = SecureRandom.urlsafe_base64(32)
    redirect_url_query = [
      "client_id=#{client_id}",
      "redirect_uri=#{redirect_uri}",
      "nonce=#{nonce}",
      "state=#{state}",
      'response_type=code',
      'scope=openid+profile'
    ]
    redirect_url_query << "prompt=#{prompt}" if prompt.present?
    AuthorizeParams.new(
      "https://#{API_HOST}/oauth2/v1/authorize?#{redirect_url_query.join('&')}",
      state
    )
  end

  def self.exchange_code(code)
    Net::HTTP.start(API_HOST, 443, use_ssl: true) do |http|
      uri = URI("https://#{API_HOST}/oauth2/v1/token")
      req = Net::HTTP::Post.new(uri)
      params = {
        client_id: ENV['OKTA_OAUTH_CLIENT_ID'],
        client_secret: ENV['OKTA_OAUTH_CLIENT_SECRET'],
        grant_type: 'authorization_code',
        redirect_uri: REDIRECT_URI,
        code: code
      }
      req.set_form_data(params)

      res = http.request(req)
      id_token = JSON.parse(res.body)['id_token']
      access_token = JSON.parse(res.body)['access_token']
      decoded_access_token = decode_jwt(access_token)
      exp = decoded_access_token.fetch('exp').to_i
      OktaToken.new(id_token, access_token, Time.at(exp))
    end
  end

  def self.decode_jwt(token)
    # a JWT (token) is a three-segment string.
    payload_segment = token.split('.')[1].to_s

    # The middle segment is a base64 encoded json payload.
    decoded_json_text = Base64.urlsafe_decode64(payload_segment)
    JSON.parse(decoded_json_text).slice('exp')
  end
end
