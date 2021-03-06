class FavoritesController < ApplicationController

  def create
      @book = Book.find(params[:book_id])
      favorite = current_user.favorites.new(book_id: @book.id)
      favorite.save
      render 'favorite'
      # render :json, book_id: @book.id
  end

  def destroy
      @book = Book.find(params[:book_id])
      favorite = current_user.favorites.find_by(book_id: @book.id)
      favorite.destroy
      render 'favorite'
  end

end
