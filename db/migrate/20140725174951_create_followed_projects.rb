class CreateFollowedProjects < ActiveRecord::Migration
  def change
    create_table :followed_projects do |t|
      t.string :project_title, null: false
      t.integer :follower_id, null: false
      t.integer :project_id, null: false

      t.timestamps
    end
    add_index :followed_projects, :project_id
    add_index :followed_projects, :follower_id
  end
end
