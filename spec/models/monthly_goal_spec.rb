require 'rails_helper'

RSpec.describe MonthlyGoal, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:monthly_goal) { FactoryBot.build(:monthly_goal, user_id: user.id) }
  
  describe "presence" do
    
    it "is valid" do
      expect(monthly_goal).to be_valid
    end
    
    it "is invalid without user_id" do
      monthly_goal.user_id = nil
      expect(monthly_goal).to_not be_valid
    end
    
    it "is invalid without monthly_aim" do
      monthly_goal.monthly_aim = " "
      expect(monthly_goal).to_not be_valid
    end
    
    it "is invalid without monthly_indicator" do
      monthly_goal.monthly_indicator = " "
      expect(monthly_goal).to_not be_valid
    end
    
    it "is invalid without term_start" do
      monthly_goal.term_start = " "
      expect(monthly_goal).to_not be_valid
    end
    
    it "is invalid without term_end" do
      monthly_goal.term_end = " "
      expect(monthly_goal).to_not be_valid
    end
    
  end
end
