class SessionsController < ApplicationController
  def create
    user = User.find_by email: params[:user][:email]
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to user_path user
    else
      flash[:alert] = ['Could not log in please try again']
      session[:login_email] = params[:user][:email]
      redirect_to new_session_path
    end
  end

  def delete
    session[:current_user] = nil
    redirect_to root_path
  end

  def new
    @user = User.new(email: session[:login_email])
  end
end