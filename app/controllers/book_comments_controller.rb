class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    if @book_comment.save
      render 'comment'
    else
    @book_comments = BookComments.where(book_id: @book.id)
    render '/books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    if @book_comment.user != current_user
      redirect_to request.referer
    else
      @book_comment.destroy
      render 'comment'
    end
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end



end
