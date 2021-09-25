require 'rails_helper'

RSpec.feature "MonthlyGoalCreates", type: :feature do
  
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  
  before do
    log_in_as(user)
  end
  
  scenario "create monthly_goal from mypage" do
    click_link "月間目標作成"
    expect(page).to have_content "1ヶ月の目標作成"
    
    fill_in "月間の目的", with: "テスト"
    fill_in "月間の目標数値、指標", with: "テスト100回"
    fill_in "開始日", with: "2021-08-01"
    fill_in "終了日", with: "2021-09-01"
    fill_in "月間アクション", with: "test"
    fill_in "数値", with: 100
    
    click_button "作成"
    
    expect(current_path).to eq user_path(user)
    expect(page).to have_content "テスト"
    expect(page).to have_content "テスト100回"
    expect(page).to have_content "2021-08-01"
    expect(page).to have_content "test"
    expect(page).to have_content 100
  end
  
  scenario "create monthly_goal from home page" do
    visit root_path
    click_link "月間目標作成"
    expect(page).to have_content "1ヶ月の目標作成"
    
    fill_in "月間の目的", with: "テスト"
    fill_in "月間の目標数値、指標", with: "テスト100回"
    fill_in "開始日", with: "2021-08-01"
    fill_in "終了日", with: "2021-09-01"
    fill_in "月間アクション", with: "test"
    fill_in "数値", with: 100
    
    click_button "作成"
    
    expect(current_path).to eq root_path
    expect(page).to have_content "テスト"
  end
  
  scenario "create monthly_goal from goal_user_path" do
    click_link "月間目標一覧"
    click_link "1ヶ月の目標を作成する"
    expect(page).to have_content "1ヶ月の目標作成"
    
    fill_in "月間の目的", with: "テスト"
    fill_in "月間の目標数値、指標", with: "テスト100回"
    fill_in "開始日", with: "2021-08-01"
    fill_in "終了日", with: "2021-09-01"
    fill_in "月間アクション", with: "test"
    fill_in "数値", with: 100
    
    click_button "作成"
    
    expect(current_path).to eq goal_user_path(user)
    expect(page).to have_content "テスト"
  end
  
end
