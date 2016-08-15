class SessionsController < ApplicationController
  def create
    user_params = params[:user]
    submitted_email = user_params[:email]
    user = User.find_by email: submitted_email
    if user && user.authenticate(user_params[:password])
      log_in user
      redirect_to user_path user
    else
      save_login_errors(submitted_email)
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

  private

  def save_login_errors(submitted_email)
    flash[:alert] = ['Could not log in please try again']
    session[:login_email] = submitted_email
  end
end
