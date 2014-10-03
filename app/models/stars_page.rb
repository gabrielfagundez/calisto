require 'nokogiri'

class StarsPage < Page

  def initialize
    super('stars', 30.seconds)
  end

end