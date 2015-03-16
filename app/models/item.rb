class Item
  def self.search(keyword, page = 1)
    Amazon::Ecs.item_search(keyword, :response_group => 'Medium',
                                     :search_index => 'Music',
                                     :country => 'jp',
                                     :item_page => page).items
  end

  def self.search_with_retry(keyword, page = 1)
    retry_count = 0
    begin
      return self.search(keyword, page)
    rescue => e
      retry_count += 1
      logger.error e.message
      if retry_count < 5
        sleep(1)
        retry
      end
    end
    return []
  end
end
