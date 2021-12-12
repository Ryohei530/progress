require 'rails_helper'

RSpec.feature "BoardsIndexes", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:board) { FactoryBot.create(:board1, user_id: user.id) }
  let!(:board_tags) { FactoryBot.create_list(:board_tag, 5, board_id: board.id) }
  
  before do
    sleep 0.1
    log_in_as(user)
  end
  
  scenario "board" do
    click_link "お悩み相談（掲示板）"
    expect(page).to have_content "brian"
    expect(page).to have_content "タグ"
    expect(page).to have_content "投稿する"
    expect(page).to have_content "tag1"
    expect(page).to have_content "tag2"
    expect(page).to have_content "tag3"
    expect(page).to have_content "board"
    expect(page).to have_css ".search"
    
    click_link "board"
    expect(page).to have_content "編集"
    expect(page).to have_content "削除"
    expect(page).to have_content "board content"
    expect(page).to have_content "コメント"
  end
end
