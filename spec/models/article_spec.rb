require 'rails_helper'

RSpec.describe Article, type: :model do
  
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.build(:article, user_id: user.id) }
  
  it "is a valid article" do
    expect(article).to be_valid
  end
  
  it "is valid with a title" do
    expect(article.title).to eq "MyString"
  end
  
  it "is invalid without a title" do
    article.title = nil
    article.valid?
    expect(article.errors[:title]).to include("を入力してください")
  end
  
  it "is valid with content" do
    expect(article.content).to eq "MyText"
  end
  
  it "is invalid without a content" do
    article.content =nil
    article.valid?
    expect(article.errors[:content]).to include("を入力してください")
  end
  
  it "is invalid without user_id" do
    article.user_id = nil
    expect(article).to_not be_valid
  end
  
  describe "class method" do
    it "returns search results that match the search term" do
      article1 = FactoryBot.create(:article, :title1, user_id: user.id,)
      # title1 { "You are string" }
      article2 = FactoryBot.create(:article, :title2, user_id: user.id,)
      # title2 { "My String is long" }
      article3 = FactoryBot.create(:article, :title3, user_id: user.id,)
      # title3 { "My String and Your string" }
      
      expect(Article.search("My")).to include(article2, article3)
      expect(Article.search("My")).to_not include(article1)
    end
  end
  
end
