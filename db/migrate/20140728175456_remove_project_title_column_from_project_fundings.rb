class RemoveProjectTitleColumnFromProjectFundings < ActiveRecord::Migration
  def change
    remove_column :project_fundings, :project_title
  end
end
