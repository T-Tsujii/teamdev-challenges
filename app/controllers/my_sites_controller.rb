class MySitesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user_id

  def update
    parameter_settings
    redirect_to edit_user_path(current_user)
  end

  private

  def my_sites_params
    params.permit(my_sites: [:name, :url])[:my_sites]
  end

  def parameter_settings
    error_items = []
    my_sites_params.to_h.map do |id, my_site_param|
      if id.to_i.positive?
        my_site = MySite.find(id)
        if my_site_param.values.join.empty?
          my_site.destroy
        else
          error_items << my_site.name unless my_site.update(my_site_param)
        end
      else
        if my_site_param.values.join.empty?
          break
        else
          my_site = current_user.my_sites.build(my_site_param)
          error_items << my_site.name unless my_site.save
        end
      end
    end
    if error_items.length.zero?
      flash[:success] = "リンクを更新しました。"
    else
      error_message = error_items.compact.reject(&:empty?).join(', ')
      error_message = "（#{error_message}）" unless error_message.empty?
      flash[:warning] = "一部のリンク#{error_message}が更新できませんでした。"
    end
  end
end
