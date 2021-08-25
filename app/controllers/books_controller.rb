class BooksController < ApplicationController

  def new
  end

  def create
    @books = Book.new(book_params)
         @book = @book.new(message_params)
     if @book.save
       redirect_to homes_path(@homes), notice: 'メッセージが送信されました'
     else
      flash.now[:alert] = 'メッセージを入力してください。'
       render :index
     end
  end

  def index
    @books = Book.all
  end

  def show
    # @books = Book.find(params[:id])
  end

  def destroy
  end

  def update
    @books = Book.new(book_params)
         @book = @book.new(message_params)
     if @book.save
       redirect_to homes_path(@homes), notice: '投稿内容が変更されました'
     else
      flash.now[:edit] = 'メッセージを入力してください。'
       render :index
     end
  end

  private
  def book_params
    params.require(:book).permit(:title,  :body)
  end


end
