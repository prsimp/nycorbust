module ApplicationHelper

  # Internal: Generate title for a page
  #
  # page_title: Title of the given page
  #
  # Examples
  #
  #   full_title("About")
  #   # => "About | NYCorBUST"
  #
  #   full_title()
  #   # => "NYCorBUST"
  #
  # Returns the full page title
  def full_title(page_title)
    base_title = "NYCorBUST"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def controller_stylesheet?(name)
    File.exists?(File.join("#{Rails.root}", "app", "assets", "stylesheets", "#{name}.css.scss"))
  end
end
