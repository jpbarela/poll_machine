class WelcomeController < ApplicationController
  def index
    redirect_to(current_user_path) if logged_in?
  end
end
