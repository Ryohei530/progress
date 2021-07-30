require 'rails_helper'

RSpec.describe "MonthlyGoals", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/monthly_goals/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/monthly_goals/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/monthly_goals/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
