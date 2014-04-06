class ReviewsController < ApplicationController
  before_action :signed_in_user

  def index
    @reviews = current_user.reviews
      .paginate(page: params[:page])
  end

  def new
    @book   = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book   = Book.find(params[:book_id])
    @review = Review.new(customer: current_user,
                         book: @book,
                         message: params[:review][:message])

    if @review.save
      flash[:success] = "Review added!"
      redirect_to book_path(@book.id)
    else
      render "reviews/new"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @book   = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def update
    @book   = Book.find(params[:book_id])
    @review = Review.find(params[:id])

    if @review.update_attributes(message: params[:review][:message])
      flash[:success] = "Review updated!"
      redirect_to book_path(@book.id)
    else
      render "reviews/edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    flash[:success] = "Review deleted"
    redirect_to customer_reviews_path(current_user)
  end

end
