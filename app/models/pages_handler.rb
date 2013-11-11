class PagesHandler

  ALL_PAGES =
      [
          BambooPage.new('bamboo', 5.seconds, 'https://build.numerexfast.com/bamboo/telemetry.action?filter=favourites'),
          ZenkaiPage.new('zenkai', 10.seconds, 'http://zenkai.herokuapp.com/api/pending_estimates.json')
      ]

  class << self

    def instance
      @@instance ||= PagesHandler.new
    end

  end

  def next!
    @current_index = (@current_index + 1) % @pages.length
    @current_page  = @pages[@current_index]
  end

  def current
    @current_page
  end

  private

  def initialize
    @pages = ALL_PAGES
    @current_index = 0
    @current_page  = @pages[@current_index]
  end

end