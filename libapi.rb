#encoding: utf-8

require 'uri'
require 'net/http'
require 'json'

class ApiPathwarNet

  URL_BASE = URI('https://api.pathwar.net/')
  URL_COUPON = URL_BASE + 'organization-coupons'

  def send url, data
    request = Net::HTTP::Post.new(url)
    request.add_field('Content-Type', 'application/json')
    request.basic_auth @user, @pass
    request.body = data.to_json
    response = @http.request(request)
    @response = response
    @request = request
    response
  end

  def send_coupon coupon
    send URL_COUPON, {'coupon' => coupon, 'organization' => @organisation}
  end

  def initialize user, pass, organisation
    @url = URL_BASE
    @user = user
    @pass = pass
    @organisation = organisation
    @http = Net::HTTP.new(@url.host, @url.port)
    @http.use_ssl = true
    # @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

end
