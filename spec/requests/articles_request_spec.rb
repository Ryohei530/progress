require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:article) { FactoryBot.create(:article, user_id: user.id) }

  describe "GET /index" do
    it "returns http success" do
      sign_in user
      get articles_path
      expect(response).to have_http_status(200)
    end
  end
end
