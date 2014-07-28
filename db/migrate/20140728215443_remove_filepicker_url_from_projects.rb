class RemoveFilepickerUrlFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :filepicker_url
  end
end
