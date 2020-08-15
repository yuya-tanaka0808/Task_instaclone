class UsersController < ApplicationController
before_action :find_user, only:[:show, :edit, :update,:destroy,:favorites]
before_action :current_user
before_action :user_checker, only: [:edit,:update,:destroy,:show]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def favorites
    @favorites = Favorite.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path,"ユーザー情報を削除しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:user_image, :user_image_cache, :password, :password_digest, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
  def user_checker
    if current_user.id != @user.id
      flash[:notice] =  "権限がありません"
      redirect_to pictures_path
    end
  end
end
