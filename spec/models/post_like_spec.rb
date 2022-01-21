require 'rails_helper'

RSpec.describe PostLike, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user2) }
  let(:post) { FactoryBot.create(:post) }
  let!(:like) { user.post_likes.create(post_id: post.id) }
  let(:like2) { user.post_likes.build(post_id: post.id) }

  it "is invalid with multiple likes by same user a post" do
    like2.valid?
    expect(like2.errors[:user_id]).to include("はすでに存在します")
  end

  it "is valid with multiple likes by each user a post" do
    like3 = user2.post_likes.build(post_id: post.id)
    expect(like3).to be_valid
  end

  it "is invalid without user_id" do
    like.user_id = nil
    expect(like).to_not be_valid
  end

  it "is invalid without post_id" do
    like.post_id = nil
    expect(like).to_not be_valid
  end
end
