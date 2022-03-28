class BooksController < ApplicationController
  before_action :authenticate_user!,except: [:top]

def index
    @user = current_user
    @books = Book.all
    @book = Book.new
end

  def new
 @book = Book.new
  end

  def create

    @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
       redirect_to books_path(), notice: '登録されました。'
     else
      flash.now[:alert] = 'エラーが出ました。 '
       render :index
     end
  end

  def show
      @user = current_user
      @book = Book.find(params[:id])
  end

  def destroy
          @book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end

  def update
    @books = Book.new(book_params)
         @book = @book.new(message_params)
     if @book.save
       redirect_to index_user_path(), notice: '投稿内容が変更されました'
     else
      flash.now[:edit] = 'sucess logout。'
       render :index
     end
  end

  def edit
     @book = current_user.books.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title,  :body)
  end


end
