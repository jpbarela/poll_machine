require 'rails_helper.rb'

RSpec.describe ApplicationController do
  controller do
    def index
      require_login
    end
  end

  describe '#require_login' do
    it 'redirects to the login path when the user is not logged in' do
      session[:current_user] = nil
      get :index
      expect(response).to redirect_to new_session_path
    end
  end
end
