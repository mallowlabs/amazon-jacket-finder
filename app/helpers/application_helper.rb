module ApplicationHelper

  def utf8_enforcer_tag
    ''
  end

  def title(page_title)
    page_title = "#{page_title} - " unless page_title.empty?
    page_title + "Amazon Jacket Finder"
  end

end
