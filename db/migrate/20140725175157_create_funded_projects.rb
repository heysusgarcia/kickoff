class CreateFundedProjects < ActiveRecord::Migration
  def change
    create_table :funded_projects do |t|
      t.string :project_title, null: false
      t.integer :amount_funded, null: false
      t.integer :project_id, null: false
      t.integer :funder_id, null: false

      t.timestamps
    end
    add_index :funded_projects, :project_id
    add_index :funded_projects, :funder_id
  end
end
