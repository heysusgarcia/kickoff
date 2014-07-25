class ChangeTableNameForFundedProjects < ActiveRecord::Migration
  def change
    rename_table :funded_projects, :project_fundings
  end
end
