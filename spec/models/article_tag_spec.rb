require 'rails_helper'

RSpec.describe ArticleTag, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user_id: user.id) }
  let(:tag) { Tag.create(name: "TestTag") }
  let(:article_tag) { article.article_tags.build(tag_id: tag.id) }

  it "is a valid article_tag" do
    expect(article_tag).to be_valid
  end

  it "is invalid without article_id" do
    article_tag.article_id = nil
    article_tag.valid?
    expect(article_tag.errors[:article_id]).to include("を入力してください")
  end

  it "is invalid without tag_id" do
    article_tag.tag_id = nil
    article_tag.valid?
    expect(article_tag.errors[:tag_id]).to include("を入力してください")
  end
end
