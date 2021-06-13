require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe "GET #new" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "logout test" do
    it "logout 2 times in 2 windows" do
      user_params = FactoryBot.attributes_for(:user)
      
      get login_path
      post login_path, params: { session: user_params }
      delete logout_path
      expect(response).to have_http_status "302"
      
      delete logout_path
      expect(response).to redirect_to "/" 
    end
  end
  
  describe "remember checkbox" do
    it "logs in with remembering" do
      user_params = FactoryBot.attributes_for(:user, remember_me: '1')
      
      get login_path
      post login_path, params: { session: user_params }
      expect(cookies[:remember_token]).to be_truthy
    end
    
    it "logs in without remembering" do
      user_params = FactoryBot.attributes_for(:user, remember_me: '1')
      
      get login_path
      post login_path, params: { session: user_params }
      delete logout_path
      
      user_params[:remember_me] = '0'
      
      get login_path
      post login_path, params: { session: user_params }
      expect(cookies[:remember_token]).to eq ""
    end
  end

end
