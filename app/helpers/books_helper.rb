module BooksHelper

  def format_books_as_string(books)
    books.map(&:title).join(', ')
  end

end
