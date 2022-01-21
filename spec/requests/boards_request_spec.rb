require 'rails_helper'

RSpec.describe "Boards", type: :request do
  
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:board) { FactoryBot.create(:board1, user_id: user.id) }

  describe "GET /index" do
    it "returns http success" do
      get boards_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get board_path(board)
      expect(response).to have_http_status(200)
    end
  end
end
