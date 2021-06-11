require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET #home" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
    
    it "has the title 'ホーム | Progress'" do
      get root_path
      expect(response.body).to include "ホーム | Progress"
    end
  end

  describe "GET #rank" do
    it "returns http success" do
      get rank_path
      expect(response).to have_http_status(:success)
    end
    
    it "has the title 'ランキング | Progress'" do
      get rank_path
      expect(response.body).to include "ランキング | Progress"
    end
  end

end