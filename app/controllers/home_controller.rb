class HomeController < ApplicationController

  def index
    @current_page = PagesHandler.instance.current
  end

  def next
    @current_page = PagesHandler.instance.next!
    render partial: @current_page
  end

end