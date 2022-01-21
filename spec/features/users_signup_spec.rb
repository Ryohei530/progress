require 'rails_helper'

RSpec.feature "UsersSignup", type: :feature do
  scenario "create a new user" do
    visit signup_path

    expect {
      fill_in "名前", with: ""
      fill_in "メールアドレス", with: "user@invalid"

      fill_in "パスワード", with: "foo"
      fill_in "確認用", with: "bar"

      click_button "アカウント作成"
    }.to_not change(User.all, :count)

    expect(page).to have_content "The form contains"
    expect(page).to have_content "名前を入力してください"
    expect(page).to have_content "メールアドレスは不正な値です"
    expect(page).to have_content "パスワードは6文字以上で入力してください"
    expect(page).to have_content "確認用とパスワードの入力が一致しません"

    expect {
      fill_in "名前", with: "Brian"
      fill_in "メールアドレス", with: "brian@example.com"

      fill_in "パスワード", with: "012345"
      fill_in "確認用", with: "012345"

      click_button "アカウント作成"
    }.to change(User.all, :count).by(1)

    expect(page).to have_content "登録が完了しました！"
    expect(page).to have_content "Brian"
    expect(page).to have_content "未設定"

    expect(page).to_not have_content "ログイン"
    within ".navbar-dark" do
      expect(page).to have_css "._rounded"
    end
  end
end