module ApplicationHelper

  # Generates the full page title
  #
  # page_title: The title of a given page
  #
  # returns: Full title of a page if given, base title otherwise.
  def full_title(page_title)
    base_title = "NYCorBUST"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

end
