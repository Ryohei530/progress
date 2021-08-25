require 'rails_helper'

RSpec.feature "UsersLogin", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { user.create_goal }
  
  scenario "user login and logout the app", js: true do
    visit login_path
    
    expect(page).to have_content "ログイン"
    click_button "ログイン"
    
    expect(page).to have_content "invalid email or password"
    visit root_path
    expect(page).to_not have_content "invalid email or password"
    
    log_in_as(user)
    
    expect(page).to have_content "#{user.name}"
    expect(page).to_not have_content "ログイン"
    
    within '.navbar-dark' do
      find(".dropdown-toggle").click
    end
    expect(page).to have_link "ログアウト"
    
    find('a', text: 'マイページ').click
    expect(current_path).to eq user_path(user)
    
    within '.navbar-dark' do
      find(".dropdown-toggle").click
    end
    expect(page).to have_link "ブックマーク一覧"
    
    click_link "ログアウト"
    sleep 5
    # find(:xpath, "//a[@href='/logout']").click
    # find('.dropdown-item', text: 'ログアウト').click
    expect(page).to have_content "みんなと目標を共有して"
    expect(page).to have_content "ログイン"
    # expect(current_path).to eq root_path
    
  end
  
  scenario "login with a valid email and a invalid password" do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "invalid"
    
    click_button "ログイン"
    
    expect(current_path).to eq login_path
    expect(page).to have_content "invalid email or password"
    
    visit root_path
    expect(page).to_not have_content "invalid email or password"
    
  end
end
