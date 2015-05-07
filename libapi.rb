#encoding: utf-8

require 'uri'
require 'net/http'
require 'json'

class ApiPathwarNet

  URL_BASE = URI('https://api.pathwar.net/')
  URL_COUPON = URL_BASE + 'organization-coupons'

  # @param url [String] the resource url to load
  # @param url [URI::HTTPS] the resource url to load
  def send url, data
    url = URL_BASE + url if url.is_a? String
    request = Net::HTTP::Post.new(url)
    request.add_field('Content-Type', 'application/json')
    request.basic_auth @user, @pass
    request.body = data.to_json
    response = @http.request(request)
    @response = response
    @request = request
    response
  end

  # @param coupons [Array] array of Strings
  def send_coupons coupons
    coupons.each{|c| send_coupon c}
  end

  # @param coupon [String]
  def send_coupon coupon
    send URL_COUPON, {'coupon' => coupon, 'organization' => @organisation}
  end

  # @param user [String] your username creditential
  # @param pass [String] your password creditential
  # @param organization [String] your organization id
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
