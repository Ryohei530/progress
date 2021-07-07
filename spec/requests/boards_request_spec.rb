require 'rails_helper'

RSpec.describe "Boards", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/boards/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/boards/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/boards/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
