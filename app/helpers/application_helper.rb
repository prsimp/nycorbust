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

  # Determines if pages for a given controller have a custom stylesheet
  # Used in the absence of Sprockets.
  #
  # name: The name of the controller
  #
  # Returns true if a stylesheet is found, false otherwise
  def controller_stylesheet?(name)
    File.exists?(File.join("#{Rails.root}", "app", "assets", "stylesheets", "#{name}.css.scss"))
  end

end
