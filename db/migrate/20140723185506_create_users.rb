class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :location
      t.text :biography
      t.text :website

      t.timestamps
    end
    add_index :users, :session_token, unique: true
    add_index :users, :email, unique: true
  end
end
