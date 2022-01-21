require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user2) }
  let(:article) { FactoryBot.create(:article, user_id: user.id) }
  let!(:bookmark) { user.bookmarks.create(article_id: article.id) }
  let(:bookmark2) { user.bookmarks.build(article_id: article.id) }

  it "is invalid with multiple bookmarks by same user an article" do
    bookmark2.valid?
    expect(bookmark2.errors[:user_id]).to include("はすでに存在します")
  end

  it "is valid with multiple bookmarks by each user an article" do
    bookmark3 = user2.bookmarks.build(article_id: article.id)
    expect(bookmark3).to be_valid
  end

  it "is invalid without user_id" do
    bookmark.user_id = nil
    expect(bookmark).to_not be_valid
  end

  it "is invalid without article_id" do
    bookmark.article_id = nil
    expect(bookmark).to_not be_valid
  end
end
