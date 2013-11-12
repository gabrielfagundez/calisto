require 'json'
require 'httparty'

class ZenkaiPage < Page

  URL = 'http://zenkai.herokuapp.com/api/pending_estimates.json'

  attr_accessor :pending

  def initialize
    super('zenkai', 45.seconds)
  end

  def process!
    response = HTTParty.get(URL)
    @pending = JSON.parse(response.body)
  end

end