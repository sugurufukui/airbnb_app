require 'rails_helper'

RSpec.describe "Users signup", type: :system do
  context "valid signup information" do
    # ユーザー登録画面を開く
    visit signup_path

    # 必要事項をフォームに入力する
    fill_in "Name", with: "Example User"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"

    # 登録ボタンをクリックすると、Userが1件増える
    expect {
      click_button "新しいアカウントを作成する"
    }.to change(User, :count).by(1)

    # ユーザー詳細画面に遷移する
    user = User.last
    expect(current_path).to eq user_path(user)

    # Welcomeメッセージが表示される
    expect(page).to have_content "ようこそ！！"

    # ナビゲーションバー内の表示が"Log in"から"Account"に切り替わる
    within '.navbar-nav' do
      expect(page).to_not have_content 'ログイン'
      expect(page).to have_content 'ルーム登録'
    end
  end
end
