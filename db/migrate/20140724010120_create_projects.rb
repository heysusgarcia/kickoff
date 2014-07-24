class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :founder_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :funding_goal, null: false
      t.integer :amount_raised, default: 0
      t.date :goal_date, null: false

      t.timestamps
    end
    add_index :projects, :founder_id
    add_index :projects, :goal_date
  end
end
