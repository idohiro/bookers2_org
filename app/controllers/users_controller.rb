class UsersController < ApplicationController
  def name
  end
  def show
     @user = current_user
  end

end
