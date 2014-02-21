class AddContentTypeToPosts < ActiveRecord::Migration
   def change
      add_column :posts, :content_type, :string
      add_index :posts, :content_type
   end
end
