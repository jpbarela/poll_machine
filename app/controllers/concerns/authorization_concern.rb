module AuthorizationConcern
  extend ActiveSupport::Concern

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end