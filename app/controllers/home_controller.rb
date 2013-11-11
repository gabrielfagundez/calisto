class HomeController < ApplicationController

  def index
    @current_page = PagesHandler.instance.current
    @current_page.process!
  end

  def next
    @current_page = PagesHandler.instance.next!
    @current_page.process!
    render partial: @current_page
  end

end