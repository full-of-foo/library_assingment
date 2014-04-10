module BooksHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def sort_column
    cols = Array.new(Book.column_names) + ["authors.full_name", "topics.title", "book_stock_count"]

    (cols.include?(params[:sort])) ? params[:sort] : "books.title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def format_books_as_string(books)
    books.map(&:title).join(', ')
  end

end
