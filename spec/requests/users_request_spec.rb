require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET #new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
    
    it "has the title 'ユーザー登録 | Progress'" do
      get signup_path
      expect(response.body).to include "ユーザー登録 | Progress"
    end
  end
  
  describe "GET #edit" do
    before do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.create(:user2)
      @other_user_params = FactoryBot.attributes_for(:user2)
    end
    
    context "not logged in" do
      it "redirects edit" do
        get edit_user_path(@user)
        expect(flash[:danger]).to be_truthy
        expect(response).to redirect_to login_url
      end
      
      it "redirects update" do
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email} }
        expect(flash[:danger]).to be_truthy
        expect(response).to redirect_to login_url
      end
      
      it "redirects index" do
        get users_path
        expect(response).to redirect_to login_url
        
      end
    end
    
    context "logged in as wrong user" do
      it "redirects edit" do
        post login_path, params: { session: @other_user_params } 
        get edit_user_path(@user)
        expect(flash[:danger]).to be_falsey
        expect(response).to redirect_to root_url
      end
      
      it "redirects update" do
        post login_path, params: { session: @other_user_params }
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email} }
        expect(flash[:danger]).to be_falsey
        expect(response).to redirect_to root_url
      end
    end
  end

end
