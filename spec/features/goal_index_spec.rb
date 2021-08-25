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
    
    click_link "goal-link", href: goal_path(goal)
    within ".goal-box" do
      expect(page).to have_content "削除"
    end
    expect(page).to have_content "長期目標"
    within ".goal-head" do
      expect(page).to have_css ".fa-arrow-left"
    end
    expect(page).to have_content "aim"
    expect(page).to have_content "indicator"
    
    within ".goal-head" do
      find(".fa-arrow-left").click
    end
    expect(current_path).to eq goals_path
    
    click_link "goal-link", href: goal_path(goal2)
    within ".goal-box" do
      expect(page).to_not have_content "削除"
    end
  end
end
