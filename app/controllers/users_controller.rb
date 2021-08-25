class UsersController < ApplicationController
  def name
  end
  def show
     @user = current_user
  end

  def create
  @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: 'Welcome! You have signed up successfully.'
    else
      flash.now[:danger] = "error"
      render :new
    end
  end

  def destroy
  session.delete(:user_id)
  @current_user = nil
  flash[:alert] = 'ログアウトしました'
  redirect_to :root
  end

  def update
    session.edit(:user_id)
  @current_user = nil
  flash[:alert] = 'You have profile edit successfully'
  redirect_to :root
  end



end
