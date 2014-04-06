class BooksWithStockCountQuery

  def initialize(relation = Book.all)
    @relation = relation
  end

  def select
    @relation
      .select(%Q(books.*, (SELECT COUNT(*) FROM "book_stocks"
              WHERE "book_stocks"."book_id" = "books"."id") AS book_stock_count))
  end

end
