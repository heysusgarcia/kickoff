class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :founder_id, null:false
      t.integer :project_id, null:false

      t.timestamps
    end
  end
end
