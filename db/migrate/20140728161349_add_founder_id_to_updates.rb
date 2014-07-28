class AddFounderIdToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :founder_id, :integer ,null: false
  end
end
