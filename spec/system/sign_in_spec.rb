require 'rails_helper'

RSpec.describe "Sessions", type: :system do

  before do
    ActionMailer::Base.deliveries.clear
  end

  def get_url_from_email_text(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end

  scenario "user successfully signs up" do
    user = build(:user)
    visit root_path
    expect(page).to have_http_status '200'
    expect(page).to have_selector '.btn', text: 'ログイン'

    find('#index_sign_up', text: '新規登録').click
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    expect { click_button "新規登録" }.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"

    mail = ActionMailer::Base.deliveries.last
    link = get_url_from_email_text(mail)

    visit link
    expect(page).to have_content "アカウントを登録しました。"
    expect(page).to have_selector '#navbarDropdown_user', text: 'ユーザー'
    expect(page).to have_no_selector '.btn', text: 'ログイン'

    click_link "ログアウト"
    expect(page).to have_current_path root_path
    expect(page).to have_content "ログアウトしました。"
    expect(page).to have_no_selector '#navbarDropdown_user', text: 'ユーザー'
    expect(page).to have_selector '.btn', text: 'ログイン'
  end

  scenario "user successfully signs in" do
    user = create(:user)
    visit root_path
    expect(page).to have_http_status '200'
    find('#index_sign_in', text: 'ログイン').click
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
  end

  scenario "user successfully reissues password" do
    user = create(:user)
    visit root_path
    expect(page).to have_http_status '200'
    find('#index_sign_in', text: 'ログイン').click
    find('#devise_link_new_password', text: 'パスワードをお忘れですか?').click
    fill_in "user_email", with: user.email
    expect { click_button "パスワードの再設定方法を送信する" }.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content "パスワードの再設定について数分以内にメールでご連絡いたします。"

    mail = ActionMailer::Base.deliveries.last
    link = get_url_from_email_text(mail)

    visit link
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "パスワードを変更する"
    expect(page).to have_content "パスワードが正しく変更されました。"
    expect(page).to have_selector '#navbarDropdown_user', text: 'ユーザー'
  end

end
