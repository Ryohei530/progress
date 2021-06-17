require 'rails_helper'

RSpec.feature "UsersIndex", type: :feature, js: true do
  let!(:admin) { FactoryBot.create(:user) }
  let!(:users) { FactoryBot.create_list(:users, 30) }
  
  scenario "index as admin including pagination and delete links" do
    log_in_as(admin)
    click_link "Users"
    
    expect(page).to have_content "All user"
    expect(page).to have_css ".users"
    expect(page).to have_css ".pagination"
    expect(page).to have_content "削除"
    
    expect{
      accept_alert do
        find(".user-Test2").click
      end
      expect(page).to have_css ".alert"
    }.to change(User, :count).by(-1)
    
    click_link "brian"
    expect(page).to have_content "brian"
  end
end
