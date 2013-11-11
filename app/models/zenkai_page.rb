require 'json'
require 'httparty'

class ZenkaiPage < Page
  attr_accessor :url, :pending

  def initialize(name, time, url)
    super(name, time)
    @url = url
  end

  def process!
    response = HTTParty.get(@url)
    @pending =  JSON.parse(response.body)
  end

end