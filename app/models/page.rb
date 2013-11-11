class Page

  attr_accessor :name, :time

  def initialize(name, time)
    @name = name
    @time = time
  end

  # To be overridden
  def process!
    self
  end

  # Needed by rails for rendering views
  def to_partial_path
    @name
  end

end


