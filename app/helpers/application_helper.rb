module ApplicationHelper

  def labeled_form_for(object, options = {}, &block)
    options[:builder] = LabeledFormBuilder
    form_for(object, options, &block)
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

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

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
