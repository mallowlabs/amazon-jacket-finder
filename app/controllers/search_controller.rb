class SearchController < ApplicationController
  def index
  end

  def search
    @query = params['search']['keyword']

    @results = Amazon::Ecs.item_search(@query, :response_group => 'Medium',
                                               :search_index => 'Music',
                                               :country => 'jp')
  end
end
