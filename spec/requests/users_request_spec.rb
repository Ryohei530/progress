require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #new" do
    it "returns http success" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end

    it "has the title 'ユーザー登録 | Progress'" do
      get new_user_registration_path
      expect(response.body).to include "ユーザー登録 | Progress"
    end
  end

  describe "redirects when not authorized user" do
    before do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.create(:user2)
      @other_user_params = FactoryBot.attributes_for(:user2)
    end

    context "not logged in" do
      it "redirects edit" do
        get edit_user_path(@user)
        expect(flash[:alert]).to be_truthy
        expect(response).to redirect_to new_user_session_url
      end

      it "redirects update" do
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email } }
        expect(flash[:alert]).to be_truthy
        expect(response).to redirect_to new_user_session_url
      end

      # it "redirects index" do
      #   get users_path
      #   expect(response).to redirect_to new_user_session_url
      # end

      it "redirects destroy" do
        expect {
          delete user_path(@user)
        }.to change(User, :count).by(0)
        expect(response).to redirect_to new_user_session_url
      end
    end

    context "logged in as wrong user" do
      it "redirects edit" do
        sign_in @other_user
        get edit_user_path(@user)
        expect(flash[:alert]).to be_truthy
        expect(response).to redirect_to root_url
      end

      it "redirects update" do
        sign_in @other_user
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email } }
        expect(flash[:alert]).to be_truthy
        expect(response).to redirect_to root_url
      end
    end

    context "logged in as non-admin user" do
      it "redirects destroy" do
        sign_in @other_user
        expect {
          delete user_path(@user)
        }.to change(User, :count).by(0)
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "admin" do
    before do
      @user = FactoryBot.create(:user)
      @user_params = FactoryBot.attributes_for(:user)
      @other_user = FactoryBot.create(:user2)
      @other_user_params = FactoryBot.attributes_for(:user2)
      @users = FactoryBot.create_list(:users, 30)
    end

    it "does not allow the admin attributes to be edited via the web " do
      sign_in @other_user
      expect(@other_user.admin).to be_falsey

      patch user_url(@other_user), params: { user: { password: "012345",
                                                     password_confirmation: "012345",
                                                     admin: true } },
                                   headers: { 'HTTP_REFERER' => edit_user_url(@other_user) }
      expect(@other_user.admin).to be_falsey
    end

    # context "log in as admin user" do
    #   it "includes pagination and delete links" do
    #     sign_in @user
    #     get users_path

    #     first_page_of_users = User.page('1').per(20)
    #     first_page_of_users.each do |user|
    #       expect(response.body).to include user.name
    #     end
    #   end
    # end

    # context "log in as non-admin user" do
    #   it "includes pagination and no delete links" do
    #     sign_in @other_user
    #     get users_path

    #     expect(response.body).to_not include "削除"
    #   end
    # end
  end
end
