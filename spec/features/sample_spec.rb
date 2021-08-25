require 'rails_helper'

RSpec.feature "Samples", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { user.create_goal }
  
    
  scenario "sample" do
    
      log_in_as(user)
      visit edit_user_path(user)
      expect(page).to have_content "プロフィール"
      
      fill_in "名前", with: ""
      fill_in "自己紹介", with: "invalidです"
      
      click_button "編集"
      expect(page).to have_content "プロフィール"
      expect(page).to have_content "error"
  end
end
