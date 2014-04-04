class RatingsController < ApplicationController
  before_action :signed_in_user

  def create
    @book   = Book.find(params[:book_id])
    @rating = Rating.new(customer: current_user,
                         book: @book,
                         amount: params[:rating][:amount])

    if @rating.save
      flash[:success] = "Rating added!"
    else
      flash[:warning] = "Oops! You cannot rate!"
    end
    redirect_to book_path(@book.id)
  end

  def update
    @book   = Book.find(params[:book_id])
    @rating = Rating.find(params[:id])

    if @rating.update_attributes(amount: params[:rating][:amount])
      flash[:success] = "Rating updated!"
    else
      flash[:warning] = "Oops! You cannot rate!"
    end
    redirect_to book_path(@book.id)
  end

end
