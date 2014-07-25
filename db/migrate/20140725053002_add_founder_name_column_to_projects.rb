class AddFounderNameColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :founder_name, :string, null: false
  end
end
