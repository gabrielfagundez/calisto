class Page

  attr_accessor :name, :url, :time

  def initialize(name, url, time)
    @name = name
    @url  = url
    @time = time
  end

  # Needed by rails for rendering views
  def to_partial_path
    @name
  end

end


