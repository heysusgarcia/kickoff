class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :project_id, null: false
      t.text :body, null: false

      t.timestamps
    end
    add_index :comments, :project_id
  end
end
