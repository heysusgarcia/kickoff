 class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :project_fundings, [:project_id, :funder_id]
    add_index :project_followings, [:project_id, :follower_id]
  end
end
