require 'rails_helper'

RSpec.describe Board, type: :model do
  
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.build(:board, user_id: user.id) }
  
  it "is a valid board" do
    expect(board).to be_valid
  end
  
  it "is valid with a title" do
    expect(board.title).to eq "MyString"
  end
  
  it "is invalid without a title" do
    board.title = nil
    board.valid?
    expect(board.errors[:title]).to include("を入力してください")
  end
  
  it "is valid with content" do
    expect(board.content).to eq "MyText"
  end
  
  it "is invalid without a content" do
    board.content =nil
    board.valid?
    expect(board.errors[:content]).to include("を入力してください")
  end
  
  it "is invalid without user_id" do
    board.user_id = nil
    expect(board).to_not be_valid
  end
  
  describe "class method" do
    it "returns search results that match the search term" do
      board1 = FactoryBot.create(:board, :title1, user_id: user.id,)
      # title1 { "You are string" }
      board2 = FactoryBot.create(:board, :title2, user_id: user.id,)
      # title2 { "My String is long" }
      board3 = FactoryBot.create(:board, :title3, user_id: user.id,)
      # title3 { "My String and Your string" }
      
      expect(Board.search("My")).to include(board2, board3)
      expect(Board.search("My")).to_not include(board1)
    end
  end
end
