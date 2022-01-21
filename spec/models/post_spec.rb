require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = @user.posts.build(content: "Lorem Ipsum")
  end
  
  describe "presence" do
    it "is valid" do
      expect(@post).to be_valid
    end
    
    it "is invalid without user_id" do
      @post.user_id = nil
      expect(@post).to_not be_valid
    end
    
    it "is invalid without content" do
      @post.content = " "
      expect(@post).to_not be_valid
    end
  end
  
  it "is too long post with over 141 chars" do
    @post.content = "a" * 141
    expect(@post).to_not be_valid
  end
  
  it "is ordered by most recently" do
    FactoryBot.create(:post)
    most_recent = FactoryBot.create(:most_recent)
    expect(most_recent).to eq Post.first
  end
end
