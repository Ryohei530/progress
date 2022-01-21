require 'rails_helper'

RSpec.feature "UsersProfiles", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:posts) { create_list(:brians, 30) }
  let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }
  let!(:report) { FactoryBot.create(:report, user_id: user.id, monthly_goal_id: monthly_goal.id) }
  let!(:report_action) { report.report_actions.create(number: 100) }

  before do
    log_in_as(user)
  end

  scenario "profile display" do
    visit user_path(user)
    expect(page).to have_content "brian"
    expect(page).to have_content "月間目標一覧"
    expect(page).to have_title "#{user.name} | Progress"
    expect(page).to have_content "長期目標"
    expect(page).to have_content "2021-12-17"
    expect(page).to have_content "aim"
    expect(page).to have_content "indicator"
    expect(page).to have_content "月間目標"
    expect(page).to have_content "2021-08-17"
    expect(page).to have_content "monthly aim"
    expect(page).to have_content "monthly indicator"
    expect(page).to have_content "アクション"
    expect(page).to have_content "test action"
    expect(page).to have_content "2021-07-17"
    expect(page).to have_css '.simple-calendar'

    visit "/users/#{user.id}?start_date=2021-08-17"
    expect(page).to have_content "目標締切日"
  end

  scenario "profile monthly_goals display" do
    visit goal_user_path(user)
    expect(page).to have_content "2021-08-17"
    expect(page).to have_content "monthly aim"
    expect(page).to have_css ".goal-li"
  end

  scenario "profile reports display" do
    visit report_user_path(user)
    expect(page).to have_content "monthly aim"
    expect(page).to have_content "report"
    expect(page).to have_content "1日目"
    expect(page).to have_content 100
    expect(page).to have_css ".report-li"
  end

  scenario "profile posts display" do
    visit post_user_path(user)
    within ".posts" do
      expect(page).to have_css '.post-li', count: 25
    end
    expect(page).to have_content "いいねしたつぶやき"
    expect(page).to have_content "Sample 1"
    expect(page).to have_css '.pagination'

    user.posts.page(1).each do |post|
      expect(page).to have_content post.content
    end
  end
end
