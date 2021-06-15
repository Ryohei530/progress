require 'rails_helper'

RSpec.feature "UsersIndex", type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  let!(:users) { create_list(:users, 30) }
  scenario "index including pagination" do
    log_in_as(user)
    click_link "Users"
    
    expect(page).to have_content "All user"
    expect(page).to have_css ".users"
    expect(page).to have_css ".pagination"
    
    click_link "brian"
    expect(page).to have_content "brian"
  end
end
