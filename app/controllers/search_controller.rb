class SearchController < ApplicationController
  def index
  end

  def search
    @query = params['search']['keyword']
  end
end
