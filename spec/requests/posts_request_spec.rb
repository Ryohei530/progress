require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end
  describe "when not logged in" do
    it "redirects create" do
      expect {
        post posts_path, params: { post: { content: "Lorem Ipsum" } }
      }.to change(Post, :count).by(0)
      expect(response).to redirect_to new_user_session_path
    end
    it "redirects destroy" do
      expect {
        delete post_path(@post), params: { post: { content: "Lorem Ipsum" } }
      }.to change(Post, :count).by(0)
      expect(response).to redirect_to new_user_session_url
    end
    it "redirects destroy for a wrong post" do
      post2 = FactoryBot.create(:post2)
      sign_in @user

      expect {
        delete post_path(post2)
      }.to change(Post, :count).by(0)
      expect(response).to redirect_to posts_path
    end
  end
end
