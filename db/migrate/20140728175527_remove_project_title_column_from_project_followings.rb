class RemoveProjectTitleColumnFromProjectFollowings < ActiveRecord::Migration
  def change
    remove_column :project_followings, :project_title
  end
end
