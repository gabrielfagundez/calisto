class BambooPage < Page
  attr_accessor :url

  def initialize(name, time, url)
    super(name, time)
    @url = url
  end

end