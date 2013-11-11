class BambooPage < Page
  attr_accessor :url

  def initialize(time, url)
    super('bamboo', time)
    @url = url
  end

end