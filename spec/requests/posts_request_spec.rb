require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    @uesr = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end
  describe "when not logged in" do
    it "redirects create" do
      expect{
        post posts_path, params: { post: { content: "Lorem Ipsum" } }
      }.to change(Post, :count).by(0)
      expect(response).to redirect_to login_url
    end
    it "redirects destroy" do
      expect{
        delete post_path(@post), params: { post: { content: "Lorem Ipsum" } }
      }.to change(Post, :count).by(0)
      expect(response).to redirect_to login_url
    end
    it "redirects destroy for a wrong post" do
      user_params = FactoryBot.attributes_for(:user)
      post2 = FactoryBot.create(:post2)
      post login_path, params: { session: user_params }
      
      expect{
        delete post_path(post2)
      }.to change(Post, :count).by(0)
      expect(response).to redirect_to root_url
    end
  end
end
