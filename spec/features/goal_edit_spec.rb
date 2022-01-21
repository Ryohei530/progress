require 'rails_helper'

RSpec.feature "GoalEdits", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { user.create_goal }

  scenario "edit a new goal" do
    log_in_as(user)
    within '.navbar-dark' do
      find(".dropdown-toggle").click
    end
    find('a', text: 'マイページ').click

    click_link "長期目標を設定"

    fill_in "開始日", with: "2021/06/27"
    fill_in "終了日", with: "2021/07/27"
    fill_in "目的、得たい結果", with: "海外で就職する。英会話スキル"
    fill_in "goal[indicator]", with: "TOEIC900"
    # fill_in "月間の目的", with: "基礎固め"
    # fill_in "月間の目標数値、指標", with: "TOEIC600"
    # fill_in "月間アクション", with: "文法テキスト"
    # fill_in "数値", with: 100

    click_button "編集"
    expect(page).to have_css ".alert"
    expect(current_path).to eq user_path(user)

    expect(page).to have_content "月間目標一覧"
    expect(page).to have_content "2021-06-27"
    expect(page).to have_content "2021-07-27"
    expect(page).to have_content "海外で就職する。英会話スキル"
    expect(page).to have_content "TOEIC900"
    # expect(page).to have_content "基礎固め"
    # expect(page).to have_content "TOEIC600"
    # expect(page).to have_content "文法テキスト"
    # expect(page).to have_content 100
  end
end

