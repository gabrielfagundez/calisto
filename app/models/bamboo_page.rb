require 'nokogiri'

class BambooPage < Page
  include HTTParty

  URL = 'https://build.numerexfast.com/bamboo/telemetry.action?filter=favourites'

  attr_accessor :body

  def initialize
    super('bamboo', 45.seconds)
  end

  def process!
    http_response = HTTParty.get(
        URL,
        basic_auth: {
            username: 'mgolffed',
            password: 'changeme'
        },
        ssl_version: :TLSv1)
    @body = Nokogiri::HTML(http_response.body).css('body').to_s
  end

end
