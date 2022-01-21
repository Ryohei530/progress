require 'rails_helper'

RSpec.describe BoardTag, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board, user_id: user.id) }
  let(:tag) { Tag.create(name: "TestTag") }
  let(:board_tag) { board.board_tags.build(tag_id: tag.id) }

  it "is a valid board_tag" do
    expect(board_tag).to be_valid
  end

  it "is invalid without board_id" do
    board_tag.board_id = nil
    board_tag.valid?
    expect(board_tag.errors[:board_id]).to include("を入力してください")
  end

  it "is invalid without tag_id" do
    board_tag.tag_id = nil
    board_tag.valid?
    expect(board_tag.errors[:tag_id]).to include("を入力してください")
  end
end
