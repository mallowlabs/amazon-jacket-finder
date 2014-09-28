class SearchController < ApplicationController
  def index
  end

  def search
    @query = params['keyword']
    @page = (params['page'] || '1')

    @items = []
    begin
      @items = Amazon::Ecs.item_search(@query, :response_group => 'Medium',
                                                 :search_index => 'Music',
                                                 :country => 'jp',
                                                 :item_page => @page).items
    rescue => e
      logger.error(e.message)
      logger.error(e.backtrace.join("\n"))
      flash[:error] = e.message
    end
  end
end
