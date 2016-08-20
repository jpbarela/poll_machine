module SessionsHelper
  def current_user_first_name
    session[:current_user]['first_name']
  end

  def current_user_id
    session[:current_user]['user_id']
  end

  def current_user_path
    user_path current_user_id
  end

  def log_in(user)
    session[:current_user] = {}
    session[:current_user]['user_id'] = user.id
    session[:current_user]['first_name'] = user.first_name
  end

  def logged_in?
    session[:current_user] && session[:current_user]['user_id']
  end
end
