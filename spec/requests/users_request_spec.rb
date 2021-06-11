require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET #new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
    
    it "has the title 'ユーザー登録 | Progress'" do
      get signup_path
      expect(response.body).to include "ユーザー登録 | Progress"
    end
  end

end
