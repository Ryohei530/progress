require 'rails_helper'

RSpec.describe GoalAction, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:goal) { user.goals.create(aim: "aim", indicator: "indicator",
                                monthly_aim: "maim", 
                                monthly_indicator: "mindcator") }
  let(:goal_action) { goal.goal_actions.build(content: "content", 
                                              number: 100,) }
  
  describe "presence" do
    
    it "is valid" do
      expect(goal_action).to be_valid
    end
    
    it "is invalid without content" do
      goal_action.content = " "
      expect(goal_action).to_not be_valid
    end
    
    it "is invalid without number" do
      goal_action.number = nil
      expect(goal_action).to_not be_valid
    end
  end
end
