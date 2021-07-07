require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:user) { FactoryBot.create(:user)}
  let(:goal) { user.goals.build(aim: "aim", indicator: "indicator",
                                monthly_aim: "maim", 
                                monthly_indicator: "mindcator") }
  
  describe "presence" do
    
    it "is valid" do
      expect(goal).to be_valid
    end
    
    it "is invalid without user_id" do
      goal.user_id = nil
      expect(goal).to_not be_valid
    end
    
    it "is invalid without aim" do
      goal.aim = " "
      expect(goal).to_not be_valid
    end
    
    it "is invalid without indicator" do
      goal.indicator = " "
      expect(goal).to_not be_valid
    end
    
    it "is invalid without monthly_aim" do
      goal.monthly_aim = " "
      expect(goal).to_not be_valid
    end
    
    it "is invalid without monthly_indicator" do
      goal.monthly_indicator = " "
      expect(goal).to_not be_valid
    end
  end
end
