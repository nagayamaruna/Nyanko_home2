class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications.where(read: false)
  end

  def mark_as_read
    # notification = current_user.notifications.find(params[:id])
    # notification.update(read: true)
    current_user.notifications.update_all(read: true)
    redirect_to rooms_path
  end


end