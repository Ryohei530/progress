require 'rails_helper'

RSpec.feature "UsersEdits", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  
  scenario "unsuccessful edit" do
    log_in_as(user)
    visit edit_user_path(user)
    expect(page).to have_content "プロフィールの編集"
    
    fill_in "Name", with: ""
    fill_in "Email", with: "foo@invalid"
    fill_in "Password", with: "foo"
    fill_in "Confirmation", with: "bar"
    
    click_button "編集"
    expect(page).to have_content "プロフィールの編集"
    expect(page).to have_content "errors"
  end
  
  scenario "seccessful edit" do
    visit edit_user_path(user)
    log_in_as(user)
    expect(current_path).to eq edit_user_path(user) 
    
    name = "Foo Bar"
    email = "foo@bar.com"
    
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: ""
    fill_in "Confirmation", with: ""
    click_button "編集"
    
    expect(page).to have_css '.alert'
    user.reload
    
    expect(name).to eq user.name
    expect(email).to eq user.email
  end
end
