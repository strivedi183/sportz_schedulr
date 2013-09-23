class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(register_user_params)
    if user.save
      redirect_to root_path
    else
      flash[:alert] = "Error: Could Not Save In Database"
      redirect_to new_user_path
    end
  end



  private
  def register_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
