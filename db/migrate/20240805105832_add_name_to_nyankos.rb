class AddNameToNyankos < ActiveRecord::Migration[6.1]
  def change
    add_column :nyankos, :name, :string
    
  end
  
end
