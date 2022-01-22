class UsersController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールが更新されました"
      redirect_to request.referer
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :bio,
                                   :password,
                                   :password_confirmation,
                                   :avatar)
    end

    def correct_user
      @user = User.find(params[:id])

      unless current_user?(@user)
        flash[:alert] = "異なるユーザーのため権限がありません"
        redirect_to(root_url)
      end
    end
end