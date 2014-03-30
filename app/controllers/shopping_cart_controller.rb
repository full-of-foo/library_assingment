class ShoppingCartController < ApplicationController

  def show
    @books = Book.id_in(shopping_cart).joins(:author, :topic)
      .order(sort_column + " " + sort_direction)
        .paginate(page: params[:page], per_page: 10)
  end

  def add
    shopping_cart << params[:book_id]

    flash[:success] = "Added to cart"
    redirect_to cart_show_path
  end

  def remove
    shopping_cart.slice!(shopping_cart.index(params[:book_id]))

    flash[:success] = "Removed from cart"
    redirect_to cart_show_path
  end

  def clear
    if !shopping_cart.empty?
      clear_cart!
      flash[:success] = "Cleared cart"
    else
      flash[:warning] = "Cart already empty"
    end

    redirect_to cart_show_path
  end
end
