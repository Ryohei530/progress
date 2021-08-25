require 'rails_helper'

RSpec.feature "UsersReports", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }
  let!(:report_actions) { FactoryBot.create_list(:report_action, 5) }
  let!(:report) { report_actions.first.report }
  
  let(:user2) { FactoryBot.create(:user2) }
  let!(:goal2) { FactoryBot.create(:goal, user_id: user2.id) }
  let!(:monthly_goal2) { FactoryBot.create(:monthly_goal, user_id: user2.id) }
  let!(:goal_action2) { monthly_goal2.goal_actions.create(content: "test action", number: 500) }
  let!(:report2) { FactoryBot.create(:report, user_id: user2.id, monthly_goal_id: monthly_goal2.id) }
  let!(:report_action2) { report2.report_actions.create(number: 100) }
  
  let!(:like1) { report.report_likes.create(user_id: user.id) }
  let!(:like2) { report2.report_likes.create(user_id: user.id) }
  
  
  
  before do
    log_in_as(user)
  end
  
  scenario "reports of mypage" do
    click_link "日報"
    
    expect(page).to have_content "1日目"
    expect(page).to have_content "2日目"
    expect(page).to have_content "3日目"
    expect(page).to have_content "4日目"
    expect(page).to have_content "5日目"
    expect(page).to have_content "report1"
    expect(page).to have_content "report2"
    expect(page).to have_content "test action"
    within ".report-#{report.id}" do
      expect(page).to have_content "1"
    end
    
    click_link "いいねした日報"
    expect(page).to have_content "1日目"
    expect(page).to have_content "brian"
    expect(page).to have_content "tanaka"
    within ".reports" do
      expect(page).to have_css '.report-li', count: 2
    end
    
  end
end
