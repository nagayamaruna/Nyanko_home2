class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :room_id
      t.integer :user_id
      t.integer :message_id
      t.string :action
      t.boolean :read, null: false, default: false
      t.timestamps
    end
  end
end
