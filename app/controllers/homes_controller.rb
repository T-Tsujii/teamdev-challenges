class HomesController < ApplicationController
  def index

  end

  def about

  end

  def recruitment

  end

  def guest_login
    user = User.find_by(email: 'test@example.com')
    sign_in user
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_path
  end
end
