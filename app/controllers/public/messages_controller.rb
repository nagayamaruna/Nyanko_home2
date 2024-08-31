class Public::MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      create_notification(message)
      redirect_to room_path(message.room)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def message_params
      params.require(:message).permit(:room_id, :dm_body)
    end

    def create_notification(message)
      room = message.room
      recipient_entry = room.entries.where.not(user_id: message.user_id).first
      recipient = recipient_entry.user
      Notification.create(user: recipient, message: message, room: room)
    end

end