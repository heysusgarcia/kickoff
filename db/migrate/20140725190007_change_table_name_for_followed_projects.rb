class ChangeTableNameForFollowedProjects < ActiveRecord::Migration
  def change
    rename_table :followed_projects, :project_followings
  end
end
