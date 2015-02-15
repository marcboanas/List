class CreateUserLists < ActiveRecord::Migration
  def change
    create_table :user_lists do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    
    add_index :user_lists, :user_id
  end
end
