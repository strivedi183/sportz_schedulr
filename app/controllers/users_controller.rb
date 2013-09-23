class UsersController < ApplicationController

  private
  def user_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
