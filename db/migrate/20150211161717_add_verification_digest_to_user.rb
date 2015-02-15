class AddVerificationDigestToUser < ActiveRecord::Migration
  def change
    add_column :users, :verification_digest, :string
  end
end
