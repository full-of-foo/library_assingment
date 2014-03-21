module ApplicationHelper

  def full_page_title(page_title)
    base_title = "Crappy Books"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
