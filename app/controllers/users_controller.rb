class UsersController < ApplicationController
  before_action :parameter_settings, only: [:edit, :update]
  before_action :authenticate_user!, except: :index
  before_action :ensure_correct_user, except: :index

  def index
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @my_sites = @user.my_sites
  end

  def update
    if @user.update(user_params)
      flash[:success] = "基本情報を更新しました。"
      redirect_to edit_user_path(@user)
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :content)
  end

  def parameter_settings
    @user = User.find(params[:id])
    @my_sites = @user.my_sites
    n = @my_sites.length
    (10 - n).times do |i|
      @user.my_sites.build(id: -i)
    end
  end
end
