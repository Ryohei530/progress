require 'rails_helper'

RSpec.describe "MonthlyGoals", type: :request do
  
  let(:user) { FactoryBot.create(:user) }
  let(:user_params) { FactoryBot.attributes_for(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }

  describe "GET /new" do
    it "returns http success" do
      sign_in user 
      get new_monthly_goal_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get monthly_goal_path(monthly_goal)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      sign_in user 
      get edit_monthly_goal_path(monthly_goal)
      expect(response).to have_http_status(200)
    end
  end
end
