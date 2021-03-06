class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.boolean :email_verification
      t.string :verification_code
      t.string :api_authtoken
      t.datetime :authtoken_expiry
      t.string :provider
      t.string :uid

      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :uid, unique: true
  end
end
