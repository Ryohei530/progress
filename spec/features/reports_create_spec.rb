require 'rails_helper'

RSpec.feature "ReportsCreates", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:post) { FactoryBot.create(:post) }
  let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }

  before do
    log_in_as(user)
  end

  scenario "create report" do
    visit root_path
    click_link "日報"

    expect(page).to have_content "monthly aim"
    expect(page).to have_content "monthly indicator"
    expect(page).to have_content "今日達成したアクション"
    expect(page).to have_content "感想、気付き"

    fill_in "report_report_actions_attributes_0_number", with: 100
    fill_in "感想、気付き", with: "テストします"
    click_button "投稿"

    expect(page).to have_css ".alert-success"
    expect(page).to have_content "投稿しました"
    expect(page).to have_content "1日目"
    expect(page).to have_content "テストします"
  end
end
