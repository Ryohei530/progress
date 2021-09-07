require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /index" do
    it "returns http success" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

end
