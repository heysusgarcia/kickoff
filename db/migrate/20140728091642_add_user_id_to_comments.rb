class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :backer_id, :integer
  end
end
