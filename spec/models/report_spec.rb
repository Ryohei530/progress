require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:report) { user.reports.build(content: "test report") }
  let(:most_recent) { user.reports.create(content: "test") }
  
  describe "presence" do
    it "is valid" do
      expect(report).to be_valid
    end
    
    it "is invalid without user_id" do
      report.user_id = nil
      expect(report).to_not be_valid
    end
    
    it "is valid without content" do
      report.content = " "
      expect(report).to be_valid
    end
    
  end
    
  it "is ordered by most recently" do
    report.created_at = 1.hour.ago
    report.save
    expect(most_recent).to eq Report.first
  end
end
