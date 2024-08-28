class CreateNyankoHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :nyanko_hashtags, id: false  do |t|
      t.references :nyanko_id, index: true, foreign_key: true
      t.references :hashtag_id, index: true, foreign_key: true
    end
  end
end
