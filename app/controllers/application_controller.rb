class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end

  def ensure_correct_user_id
    if current_user.id != params[:user_id].to_i
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
end
