class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @users = User.all
    @user = current_user
    @books = @user.books
    @book = Book.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      redirect_to user_path, success: 'Welcome! You have signed up successfully.'
    else
      flash.now[:danger] = "error"
      render :new
    end
  end

  def destroy
　@user =User.session.delete(:user_id)

  flash[:alert] = 'Signed out successfully.'
  redirect_to :root
  end

  def update
       @user = User.find(params[:id])
    @user.update(user_params)
  @current_user = nil
  flash[:alert] = 'You have profile edit successfully'
  redirect_to :root
  end

  def edit
     @user = User.find(params[:id])
  end

   def user_params
    params.require(:user).permit(:name, :title)
   end

end
