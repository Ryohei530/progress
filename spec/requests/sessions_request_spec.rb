require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe "GET #new" do
    it "returns http success" do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "logout test" do
    it "logout 2 times in 2 windows" do
      get new_user_session_path
      sign_in user
      delete destroy_user_session_path
      expect(response).to have_http_status "302"
      
      delete destroy_user_session_path
      expect(response).to redirect_to "/" 
    end
  end
  
  pending "remember checkbox" do
    it "logs in with remembering" do
      user_params = FactoryBot.attributes_for(:user, remember_me: '1')
      
      get new_user_session_path
      post user_session_path, params: { session: user_params }
      expect(cookies[:remember_token]).to be_truthy
    end
    
    it "logs in without remembering" do
      user_params = FactoryBot.attributes_for(:user, remember_me: '1')
      
      get new_user_session_path
      post user_session_path, params: { session: user_params }
      delete destroy_user_session_path
      
      user_params[:remember_me] = '0'
      
      get new_user_session_path
      post user_session_path, params: { session: user_params }
      expect(cookies[:remember_token]).to eq ""
    end
  end
end
