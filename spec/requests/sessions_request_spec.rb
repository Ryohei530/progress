require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET #new" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "logout test" do
    it "logout 2 times in 2 windows" do
      user = FactoryBot.create(:user)
      user.valid?
      user_params = FactoryBot.attributes_for(:user)
      
      get login_path
      post login_path, params: { session: user_params }
      delete logout_path
      expect(response).to have_http_status "302"
      
      delete logout_path
      expect(response).to redirect_to "/" 
    end
  end

end
