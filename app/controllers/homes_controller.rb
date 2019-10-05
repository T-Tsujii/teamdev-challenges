class HomesController < ApplicationController
  def index

  end

  def about

  end

  def recruitment

  end

  # ゲストユーザー用
  def guest_sign_in
    new_user_check = false
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      new_user_check = true
    end
    # 新規ユーザー作成時と，前回のゲストログインor更新から３０分以上経過している場合はデータを初期化する
    data_initialization(user) if new_user_check || Time.now - user.updated_at > 1800
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def data_initialization(user)
    user.sites.destroy_all
    user.preferred_languages.destroy_all
    user.languages.destroy_all
    user.learnings.destroy_all
    user.teams.destroy_all
    user.team_participants.destroy_all
    user.posts.destroy_all

    sites_attributes_params = [
      { name: 'Twitter', url: 'https://twitter.com/take18k_tech/' },
      { name: 'GitHub', url: 'https://github.com/T-Tsujii/teamdev-challenges' },
      { name: 'ブログ', url: 'https://take18k-tech.blogspot.com/' }
    ]

    user_params = {
      # ゲストログイン時にデータを初期化するかどうか判断できるようにupdated_atを更新
      updated_at: Time.now,
      name: '★ゲスト★',
      content: 'ゲストユーザーの各種データは30分後に初期化されます。
また，ゲストユーザーはニックネームを変更できない設定としております。ご了承下さい。',
      sites_attributes: sites_attributes_params
    }
    user.update(user_params)
  end
end
