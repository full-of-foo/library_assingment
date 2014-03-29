class BookStocksController < ApplicationController
  before_action :signed_in_user
  before_action :permitted_admin

  def create_or_destroy_multiple
    @book          = Book.find(params[:book_id])
    desired_amount = params[:stock_count].to_i

    if is_increase_amount?(desired_amount)
      increase_book_stock(desired_amount - @book.stock_count)

      flash[:success] = "Stock amount increased"
      redirect_to book_path(@book)

    elsif is_equal_amount?(desired_amount)
      flash[:warning] = "Stock amount unchanged"
      redirect_to book_path(@book)

    else
      descrease_book_stock(@book.stock_count - desired_amount)

      flash[:success] = "Stock amount decreased"
      redirect_to book_path(@book)
    end
  end


  private

    def is_increase_amount?(amount)
      amount > @book.stock_count
    end

    def is_equal_amount?(amount)
      amount == @book.stock_count
    end

    def increase_book_stock(amount)
      amount.times do
        BookStock.create(book: @book)
      end
    end

    def descrease_book_stock(amount)
      amount.times do
        BookStock.where(book: @book).last.destroy
      end
    end

end
