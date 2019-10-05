class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :ensure_correct_user, except: :index

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    parameter_settings
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to edit_user_path(@user), success: success_message }
        format.js { flash.now[:success] = success_message }
      end

    else
      respond_to do |format|
        flash.now[:warning] = @user.errors.full_messages.join(", ")
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "ユーザー情報を削除しました。"
    redirect_to root_path
  end

  private

  def user_params
    sites_attributes = [:id, :name, :url, :_destroy]
    if @user.email == 'guest@example.com'
      params.require(:user).permit(:content, sites_attributes: sites_attributes)
    else
      params.require(:user).permit(:name, :content, sites_attributes: sites_attributes)
    end
  end

  def parameter_settings
    n = @user.sites.length
    (10 - n).times do |i|
      @user.sites.build
    end
  end

  def success_message
    if user_params[:content].present?
      '基本情報を更新しました。'
    elsif user_params[:sites_attributes].present?
      'リンクを更新しました。'
    else

    end
  end
end
