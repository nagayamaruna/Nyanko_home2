class CreateNyankogramPostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :nyankogram_post_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :nyankogram_id
      t.string :name
      t.timestamps
    end
  end
end
