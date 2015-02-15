class CreateUserListItems < ActiveRecord::Migration
  def change
    create_table :user_list_items do |t|
      t.text :description
      t.boolean :completed
      t.datetime :completion_date
      t.integer :user_list_id

      t.timestamps
    end
    
    add_index :user_list_items, :user_list_id
  end
end
