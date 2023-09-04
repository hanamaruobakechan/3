class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @user = @book.user
    if @book_comment.save
      redirect_to book_path(@book.id)
    else
      render "books/show"
    end
  end
  
  def destroy
    @book = BookComment.find(params[:id]).destroy
    user = @book.user
    unless user.id == current_user.id
      redirect_to book_path
    end
    @book = Book.find(params[:book_id])
    redirect_to book_path(@book.id)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
