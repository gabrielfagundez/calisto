require 'nokogiri'

class BambooPage < Page
  include HTTParty

  attr_accessor :url, :body, :doc

  def initialize(time, url)
    super('bamboo', time)
    @url = url
  end

  def process!
    http_response = HTTParty.get(
        url,
        basic_auth: {
            username: 'mgolffed',
            password: 'changeme'
        },
        ssl_version: :SSLv3)
    @body = Nokogiri::HTML(http_response.body).css('body').to_s
  end

end