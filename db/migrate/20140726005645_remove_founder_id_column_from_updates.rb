class RemoveFounderIdColumnFromUpdates < ActiveRecord::Migration
  def  change
    remove_column :updates, :founder_id
  end
end
