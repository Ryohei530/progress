require 'rails_helper'

RSpec.describe "Goals", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
  let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }

  describe "GET /index" do
    it "returns http success" do
      get goals_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get goal_path(goal)
      expect(response).to have_http_status(200)
    end
  end
end
