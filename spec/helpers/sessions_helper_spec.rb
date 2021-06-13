require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }
  
  before do
    remember(user)
  end
  
  describe "current_user test" do
    it "returns right user when session is nil" do
      expect(user).to eq current_user
      expect(!current_user.nil?).to be true
    end
    
    it "returns nil when remember digest is wrong" do
      user.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to be nil
    end
  end
end