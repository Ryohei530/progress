require 'rails_helper'

RSpec.feature "Samples", type: :feature do
  
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { user.create_goal }
  
    
  scenario "sample" do
    visit login_path
    
    expect(page).to have_content "ログイン"
    click_button "ログイン"
    
    expect(page).to have_content "invalid email or password"
    visit root_path
    expect(page).to_not have_content "invalid email or password"
    
    log_in_as(user)
    
    expect(page).to have_content "#{user.name}"
    expect(page).to_not have_content "ログイン"
  end
end
