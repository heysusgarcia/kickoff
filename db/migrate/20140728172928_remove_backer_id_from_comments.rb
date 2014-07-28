class RemoveBackerIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :backer_id
  end
end
