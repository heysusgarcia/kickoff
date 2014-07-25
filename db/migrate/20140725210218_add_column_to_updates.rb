class AddColumnToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :body, :text, null: false
  end
end
