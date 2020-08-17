module PicturesHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def confirm_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_pictures_path
    elsif action_name == 'edit' || action_name == 'update'
      #confirm_picture_path(@picture.id)
      picture_path
    end
  end

end
