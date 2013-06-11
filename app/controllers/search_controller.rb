class SearchController < ApplicationController
  def index
  end

  def search
    @query = params['keyword']
    @page = (params['page'] || '1')

    @results = Amazon::Ecs.item_search(@query, :response_group => 'Medium',
                                               :search_index => 'Music',
                                               :country => 'jp',
                                               :item_page => @page)
  end
end
