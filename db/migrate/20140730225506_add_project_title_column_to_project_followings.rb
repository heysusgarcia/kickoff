class AddProjectTitleColumnToProjectFollowings < ActiveRecord::Migration
  def change
    add_column :project_followings, :project_title, :string
  end
end
