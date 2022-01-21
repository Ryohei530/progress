require 'rails_helper'

RSpec.feature "GoalIndexes", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:goal2) { FactoryBot.create(:goal, user_id: user2.id) }
  let!(:monthly_goal2) { FactoryBot.create(:monthly_goal, user_id: user2.id) }
  let!(:goal_action2) { monthly_goal2.goal_actions.create(content: "test action", number: 500) }
  let!(:running_day) { FactoryBot.create_list(:running_day, 7, user_id: user.id) }
  let!(:r_day) { FactoryBot.create(:r_day, :day3) }

  scenario "goals" do
    log_in_as(user)
    click_link "みんなの目標"

    expect(current_path).to eq goals_path
    expect(page).to have_content "期間"
    expect(page).to have_content "1ヶ月間のアクション"
    expect(page).to have_content "brian"
    expect(page).to have_content "tanaka"
    expect(page).to have_content "aim"
    expect(page).to have_content "indicator"

    within "#goal-#{goal.id}" do
      find(".card-link").click
    end
    within ".card-box" do
      expect(page).to have_content "削除"
    end
    expect(page).to have_content "長期目標"
    within ".card-header" do
      expect(page).to have_css ".fa-arrow-left"
    end
    expect(page).to have_content "aim"
    expect(page).to have_content "indicator"

    within ".card-header" do
      find(".card-back").click
    end
    expect(current_path).to eq goals_path

    within "#goal-#{goal2.id}" do
      find(".card-link").click
    end
    within ".card-box" do
      expect(page).to_not have_content "削除"
    end
  end
end
