class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
    def authenticate_user
      if @current_user == nil

        redirect_to new_session_path
      end
    end
    def check_user
      if current_user.id != @picture.user.id
        flash[:notice] = "権限がありません"
        redirect_to feeds_path
      end
    end
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end
    def confirm_new_or_edit
      if action_name == 'new' || action_name == 'create'
        confirm_pictures_path
      elsif action_name == 'edit' || action_name == 'update'
        confirm_picture_path(@picture.id)

      end
    end
    def confirm_form_method
      @picture.id ? 'patch' : 'post' # 作成時はpost, 編集時は patchを指定
    end
  end
