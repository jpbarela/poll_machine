class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path user
    else
      flash[:alert] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end