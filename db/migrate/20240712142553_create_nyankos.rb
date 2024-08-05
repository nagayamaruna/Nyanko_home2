class CreateNyankos < ActiveRecord::Migration[6.1]
  def change
    create_table :nyankos do |t|
      t.string :title
      t.string :body
      t.string :image
      t.integer :user_id
      t.timestamps
      add_column :nyankos, :name, :string
    end
  end
end
