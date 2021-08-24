class BooksController < ApplicationController

  def new
  end

  def create
    @books = Book.new(book_params)
    book.save
    # 以下の行を修正
    redirect_to book_path(book.id)
  end

  def index
    @books = Book.all
  end

  def show
    # @books = Book.find(params[:id])
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title,  :body)
  end
end
