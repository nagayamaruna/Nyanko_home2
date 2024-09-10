class CreateNyankoTags < ActiveRecord::Migration[6.1]
  def change
    create_table :nyanko_tags do |t|
      t.references :nyanko, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
