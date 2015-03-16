class SearchController < ApplicationController
  def index
  end

  def search
    @query = params['keyword']
    @page = (params['page'] || '1')

    @items = []
    begin
      @items = Item.search_with_retry(@query, @page)
    rescue => e
      logger.error(e.message)
      logger.error(e.backtrace.join("\n"))
      flash[:error] = e.message
    end
  end
end
