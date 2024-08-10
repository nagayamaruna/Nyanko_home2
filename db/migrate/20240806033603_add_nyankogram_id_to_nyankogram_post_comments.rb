class AddNyankogramIdToNyankogramPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :nyankogram_post_comments, :nyankogram_id, :integer
  end
end
