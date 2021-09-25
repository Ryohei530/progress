require 'rails_helper'

RSpec.feature "UsersEdits", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { user.create_goal }
  
  scenario "unsuccessful edit" do
    log_in_as(user)
    visit edit_user_path(user)
    expect(page).to have_content "プロフィール"
    
    fill_in "名前", with: ""
    fill_in "自己紹介", with: "invalidです"
    
    click_button "編集"
    expect(page).to have_content "プロフィール"
    expect(page).to have_content "error"
    
    click_link "メールアドレス"
    fill_in "メールアドレス", with: ""
    click_button "編集"
    
    expect(page).to have_content "メールアドレス"
    expect(page).to have_content "error"
    
    click_link "パスワード"
    fill_in "パスワード", with: "123"
    fill_in "確認用", with: ""
    click_button "編集"
    
    expect(page).to have_content "パスワード"
    expect(page).to have_content "error"
    
  end
  
  scenario "seccessful edit" do
    visit edit_user_path(user)
    log_in_as(user)
    expect(current_path).to eq edit_user_path(user) 
    
    name = "Foo Bar"
    email = "foo@bar.com"
    
    fill_in "名前", with: name
    fill_in "自己紹介", with: "validです"
    click_button "編集"
    expect(page).to have_css '.alert-success'
    
    click_link "メールアドレス"
    
    fill_in "メールアドレス", with: email
    click_button "編集"
    expect(page).to have_css '.alert-success'
    
    click_link "パスワード"
    
    fill_in "パスワード", with: ""
    fill_in "確認用", with: ""
    click_button "編集"
    expect(page).to have_css '.alert-success'
    
    user.reload
    
    expect(name).to eq user.name
    expect(email).to eq user.email
  end
end
