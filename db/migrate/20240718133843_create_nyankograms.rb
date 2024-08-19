class CreateNyankograms < ActiveRecord::Migration[6.1]
  def change
    create_table :nyankograms do |t|
      t.text :post_body
      t.string :post_image
      t.integer :user_id
      t.timestamps
      t.string :name
    end
  end
end
