require 'rails_helper'

RSpec.describe ReportAction, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let(:report) { FactoryBot.create(:report, user_id: user.id, monthly_goal_id: monthly_goal.id) }
  let(:report_action) { report.report_actions.build(number: 123) }
  let(:most_recent) { report.report_actions.create(number: 100) }
  
  describe "presence" do 
    it "is valid" do
      expect(report_action).to be_valid
    end
    
    it "is invalid without number" do
      report_action.number = nil
      expect(report_action).to_not be_valid
    end
  end
  
  it "is ordered by most recently" do
    report_action.created_at = 1.hour.ago
    report_action.save
    expect(most_recent).to eq ReportAction.first
  end
end
