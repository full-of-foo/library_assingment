module SessionsHelper

  def base64_remember_token
    SecureRandom.urlsafe_base64
  end

  def hash_token(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = hash_token(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def shopping_cart
    session[:cart] ||= []
  end

  def clear_cart!
    session[:cart] = nil
  end

  def carted_book_quantity(book)
    shopping_cart.select {|id| id == book.id.to_s}.size
  end

  def carted_book_total_price(book)
    carted_book_quantity(book) * book.price
  end

  def carted_books_total_cost
    Book.id_in(shopping_cart).to_a.each do |book|
      quantity   = carted_book_quantity(book)
      book.price = book.price * quantity
    end.map(&:price).sum
  end

  def is_book_cartable?(book)
    carted_book_quantity(book) < book.stock_count
  end

  def carted_books_in_stock?
    shopping_cart.any? do |id|
      book            = Book.find(id)
      carted_quantity = carted_book_quantity(book)

      carted_quantity <= book.stock_count
    end
  end

end
