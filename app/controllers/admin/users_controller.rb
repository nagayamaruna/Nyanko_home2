class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    if params[:keyword].present?
      @users = @users.where('id LIKE ?', "%#{params[:keyword]}%").or(
               @users.where('name LIKE ?', "%#{params[:keyword]}%")).or(
               @users.where('comment LIKE ?', "%#{params[:keyword]}%"))
    end
  end
  
  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
end
