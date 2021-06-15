require 'rails_helper'

RSpec.feature "UsersSignup", type: :feature do
  scenario "you create a new user" do
    
    visit signup_path
    
    expect{
      fill_in "Name", with: ""
      fill_in "Email", with: "user@invalid"
      
      fill_in "Password", with: "foo"
      fill_in "Confirmation", with: "bar"
      
      click_button "アカウント作成"
    }.to_not change(User.all,  :count)
    
    expect(page).to have_content "The form contains"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email is invalid"
    expect(page).to have_content "Password is too short"
    
    expect{
      fill_in "Name", with: "Brian"
      fill_in "Email", with: "brian@example.com"
      
      fill_in "Password", with: "012345"
      fill_in "Confirmation", with: "012345"
      
      click_button "アカウント作成"
    }.to change(User.all, :count).by(1)
    
    expect(page).to have_content "登録が完了しました！"
    expect(page).to have_content "brian"
    
    expect(page).to_not have_content "ログイン" 
    expect(page).to have_content "アカウント" 
  end
end