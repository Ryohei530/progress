require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:post) { FactoryBot.create(:post) }
  let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }
  let!(:report) { FactoryBot.create(:report, user_id: user.id, monthly_goal_id: monthly_goal.id) }
  let!(:report_action) { report.report_actions.create(number: 100) }
  
  
  scenario "home page when not logged in" do
    visit root_path
    
    expect(page).to have_content "Progress"
    expect(page).to have_content "みんなと目標を共有して"
    expect(page).to have_content "新規登録"
    expect(page).to have_content "ゲストログイン"
    expect(page).to have_content "メールアドレス"
    expect(page).to have_content "ログイン"
    expect(page).to have_content "メニュー"
    
    click_link "日報"
    expect(page).to_not have_content "みんなと目標を共有して"
    expect(page).to_not have_content "新規作成"
  end
  
  scenario "home page when logged in" do
    visit root_path
    
    fill_in "メールアドレス", with: "brian@example.com"
    fill_in "パスワード", with: "012345"
    click_button "ログイン"
    
    click_link "Progress"
    
    expect(page).to_not have_content "みんなと目標を共有して"
    expect(page).to_not have_content "新規作成"
    expect(page).to have_content "長期目標"
    expect(page).to have_content "期間"
    expect(page).to have_content "目的、得たい結果"
    expect(page).to have_content "今月の目的"
    expect(page).to have_content "1ヶ月間のアクション"
    expect(page).to have_css ".content-form"
    
    
    click_link "日報"
    
    expect(page).to have_content "長期目標"
    expect(page).to have_content "期間"
    expect(page).to have_content "目的、得たい結果"
    expect(page).to have_content "今月の目的"
    expect(page).to have_content "1ヶ月間のアクション"
    expect(page).to have_css ".content-form"
  end
end
