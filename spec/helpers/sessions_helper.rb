require 'rails_helper.rb'

RSpec.describe SessionsHelper do
  before do
    session[:current_user] = {}
    session[:current_user]['first_name'] = 'Test'
    session[:current_user]['user_id'] = 4242
  end

  describe '#current_user_first_name' do
    it 'returns the first name of the current user' do
      expect(current_user_first_name).to eq 'Test'
    end
  end

  describe '#current_user_id' do
    it 'returns the user id of the current user' do
      expect(current_user_id).to be 4242
    end
  end

  describe '#current_user_path' do
    it 'returns the path of the current user' do
      expect(current_user_path).to eq user_path 4242
    end
  end

  describe '#log_in' do
    let(:user) { FactoryGirl.create :user }

    before { log_in user }

    it 'sets the current user id' do
      expect(current_user_id).to be user.id
    end

    it 'sets the current user first name' do
      expect(current_user_first_name).to eq user.first_name
    end
  end

  describe '#logged_in?' do
    it 'returns false if there is no current user' do
      session[:current_user] = nil
      expect(logged_in?).to be_falsey
    end

    it 'returns true if there is a current user with a user id' do
      expect(logged_in?).to be_truthy
    end
  end
end
