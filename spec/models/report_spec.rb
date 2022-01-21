require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:report) { user.reports.build(content: "test report", monthly_goal_id: m_goal.id) }
  let(:most_recent) { user.reports.create(content: "test", monthly_goal_id: m_goal.id) }
  let(:m_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }

  describe "presence" do
    it "is valid" do
      expect(report).to be_valid
    end

    it "is invalid without user_id" do
      report.user_id = nil
      expect(report).to_not be_valid
    end

    it "is invalid without monthly_goal_id" do
      report.monthly_goal_id = nil
      expect(report).to_not be_valid
    end

    it "is valid without content" do
      report.content = " "
      expect(report).to_not be_valid
    end
  end

  it "is ordered by most recently" do
    report.created_at = 1.hour.ago
    report.save
    expect(most_recent).to eq Report.first
  end
end
