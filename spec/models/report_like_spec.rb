require 'rails_helper'

RSpec.describe ReportLike, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user2) }
  let(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let(:report) { FactoryBot.create(:report, user_id: user.id, monthly_goal_id: monthly_goal.id) }
  let!(:like) { user.report_likes.create(report_id: report.id) }
  let(:like2) { user.report_likes.build(report_id: report.id) }
  
  it "is invalid with multiple likes by same user a report" do
    like2.valid?
    expect(like2.errors[:user_id]).to include("はすでに存在します")
  end
  
  it "is valid with multiple likes by each user a report" do
    like3 = user2.report_likes.build(report_id: report.id)
    expect(like3).to be_valid
  end
  
  it "is invalid without user_id" do
    like.user_id = nil
    expect(like).to_not be_valid
  end
  
  it "is invalid without report_id" do
    like.report_id = nil
    expect(like).to_not be_valid
  end
end
