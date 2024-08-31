class CreateNyankoHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :nyanko_hashtags, id: false  do |t|
      t.references :nyanko, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
      t.index [:nyanko_id, :hashtag_id], unique: true
    end
  end
end
