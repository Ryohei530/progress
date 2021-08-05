require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:user) { FactoryBot.create(:user)}
  let(:goal) { user.build_goal(user_id: user.id) }
  
  describe "presence" do
    
    it "is a valid goal" do
      expect(goal).to be_valid
    end
    
    it "is invalid without user_id" do
      goal.user_id = nil
      expect(goal).to_not be_valid
    end
  end
end
