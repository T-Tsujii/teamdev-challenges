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
    @my_sites = @user.my_sites
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "基本情報を更新しました。"
      redirect_to edit_user_path(@user)
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      parameter_settings
      render :edit
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
    params.require(:user).permit(:name, :content)
  end

  def parameter_settings
    @my_sites = @user.my_sites
    n = @my_sites.length
    (10 - n).times do |i|
      @user.my_sites.build(id: -i)
    end
  end
end
