class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      # Required
      t.string :email, null: false, unique: true
      t.string :password_digest
      
      # Confirmation
      t.string :confirmation_token
      t.boolean :confirmed, default: false, null: false

      # Password reset
      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end

    add_index :users, :email, unique: true
    
  end
end