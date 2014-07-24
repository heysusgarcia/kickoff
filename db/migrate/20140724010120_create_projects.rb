class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :founder
      t.string :title
      t.text :description
      t.integer :funding_goal
      t.integer :amount_raised
      t.date :goal_date

      t.timestamps
    end
  end
end
